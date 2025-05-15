#Find pull-request URL:
$mergeLessPRPath = $Env:prPath.Substring(0, $Env:prPath.indexOf("/merge")) #Trim off "/merge"
$PullRequestUrl = "$Env:gitHubHost/$Env:repoPath/$($mergeLessPRPath.Substring($mergeLessPRPath.indexOf("pull/")))" #Combine to URL, remove "/refs" i.e only include "pull/<nr>"

#Bruk Github CLI til å finne siste commit melding i PRen
$CommitMessage = gh pr view $PullRequestUrl --json commits | ConvertFrom-Json | Select-Object -Expand commits | ForEach-Object { $_.messageHeadline } | Select-Object -Last 1
if ( $CommitMessage -match '^doc:(\s|\S)*$') {
  Write-Output "::notice::The latest commit indicates a documentation change. Merging this pull-request will not alter the version number."
  exit 0
} elseif ( $CommitMessage -match '^fix:(\s|\S)*$' ) {
  Write-Output "::notice::The latest commit indicates a fix change. Merging this pull-request will increase the minor (0.0.x) version number."
  exit 0
} elseif ( $CommitMessage -match '^feat:(\s|\S)*$' ) {
  Write-Output "::notice::The latest commit indicates a non-breaking feature change. Merging this pull-request will increase the middle (0.x.0) version number."
  exit 0
} elseif ( $CommitMessage -match '^feat!:(\s|\S)*$' ) {
  Write-Output "::notice::The latest commit indicates a breaking feature change. Merging this pull-request will increase the major (x.0.0) version number."
  exit 0
} else {
  Write-Output "::error title=Naming-Convention-Error::The commit message did not follow the agreed upon naming convention, the name of the latest commit was: $CommitMessage"
  exit 1
}