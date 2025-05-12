$CommitMessage = git log --format=%B -n 1 HEAD
$releaseType = ""

#Determine release type based on commit message.
if ( $CommitMessage -match '^doc:.*$') {
  $releaseType = 'doc'
} elseif ( $CommitMessage -match '^fix:(\s|\S)*$' ) {
  $releaseType = 'fix'
} elseif ( $CommitMessage -match '^feat:(\s|\S)*$' ) {
  $releaseType = 'feat'
} elseif ( $CommitMessage -match '^feat!:(\s|\S)*$' ) {
  $releaseType = 'breaking'
} else {
  Write-Output "::error title=Naming-Convention-Error::The commit message did not follow the agreed upon naming convention, the name of the lates commit was: $CommitMessage"
  exit 1
}

Write-Output "::notice::The merge was determined to be a $releaseType change"

Add-Content -Value "releaseType=$releaseType" -Path $Env:GITHUB_OUTPUT -Encoding utf8