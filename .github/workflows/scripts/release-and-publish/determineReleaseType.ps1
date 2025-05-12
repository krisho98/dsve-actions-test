$CommitMessage = git log --format=%B -n 1 HEAD
$RepositoryHost = $Env:RepositoryHost.Substring($Env:RepositoryHost.indexOf("/") + 1)
$RepositoryURI = "$Env:RepositoryHost/$Env:RepositoryURI"
$CurrentReleaseName = gh release view --repo $RepositoryURI

Write-Output "::notice::Latest release in this repository was a release with name: $CurrentReleaseName"

if ( $CommitMessage -match '^doc:.*$') {
  Add-Content -Value "releaseType=doc" -Path $Env:GITHUB_OUTPUT -Encoding utf8
} elseif ( $CommitMessage -match '^fix:(\s|\S)*$' ) {
  Add-Content -Value "releaseType=fix" -Path $Env:GITHUB_OUTPUT -Encoding utf8
} elseif ( $CommitMessage -match '^feat:(\s|\S)*$' ) {
  Add-Content -Value "releaseType=feat" -Path $Env:GITHUB_OUTPUT -Encoding utf8
} elseif ( $CommitMessage -match '^feat!:(\s|\S)*$' ) {
  Add-Content -Value "releaseType=breaking" -Path $Env:GITHUB_OUTPUT -Encoding utf8
} else {
  Write-Output "::error title=Naming-Convention-Error::The commit message did not follow the agreed upon naming convention, the name of the lates commit was: $CommitMessage"
  exit 1
}