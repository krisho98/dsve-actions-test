#Find pull-request URL:
Write-Output "GitHub Host: $Env:gitHubHost"
Write-Output "Repo Path: $Env:repoPath"
Write-Output "PR Path: $Env:prPath"
$mergeLessPRPath = $Env:prPath.Substring(0, $Env:prPath.indexOf("/merge"))
$PullRequestUrl = "$Env:gitHubHost/$Env:repoPath/$($mergeLessPRPath.Substring($mergeLessPRPath.indexOf("pull/")))"

Write-Output "PR URL: $PullRequestUrl"

$CommitMessage = git log --format=%B -n 1 HEAD
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