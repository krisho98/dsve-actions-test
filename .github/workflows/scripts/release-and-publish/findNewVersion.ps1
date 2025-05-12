$RepositoryHost = $Env:RepositoryHost.Substring($Env:RepositoryHost.indexOf("/") + 1)
$RepositoryURI = "$Env:RepositoryHost/$Env:RepositoryURI"
$CurrentRelease = gh release view --repo $RepositoryURI --json name,tagName,createdAt,body | ConvertFrom-Json

Write-Output "::notice::Latest release in this repository was a release with name: $($CurrentRelease.name), tag version: $($CurrentRelease.tagName)"

$MajorVersionNumber = [int]$CurrentRelease.tagName.split(".")[0]
$NormalVersionNumber = [int]$CurrentRelease.tagName.split(".")[1]
$MinorVersionNumber = [int]$CurrentRelease.tagName.split(".")[3]

switch ($Env:ReleaseType) {
  fix {
    $MinorVersionNumber = $MinorVersionNumber + 1
  }
  feat {
    $NormalVersionNumber = $NormalVersionNumber + 1
  }
  breaking {
    $MajorVersionNumber = $MajorVersionNumber + 1
  }
}

$NewTagVersion = "$MajorVersionNumber.$NormalVersionNumber.$MinorVersionNumber"

Write-Output "::notice::New version is: $NewTagVersion"

Add-Content -Value "newVersionNumber=$NewTagVersion" -Path $Env:GITHUB_OUTPUT -Encoding utf8