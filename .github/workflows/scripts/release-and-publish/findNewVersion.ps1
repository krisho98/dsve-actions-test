$RepositoryHost = $Env:RepositoryHost.Substring($Env:RepositoryHost.indexOf("/") + 1)
$RepositoryURI = "$Env:RepositoryHost/$Env:RepositoryURI"
$CurrentRelease = gh release view --repo $RepositoryURI --json name,tagName,createdAt,body | ConvertFrom-Json

Write-Output "::notice::Latest release in this repository was a release with name: $($CurrentRelease.name), tag version: $($CurrentRelease.tagName)"

$MajorVersionNumber = [int]$CurrentRelease.tagName.split(".")[0]
$NormalVersionNumber = [int]$CurrentRelease.tagName.split(".")[1]
$MinorVersionNumber = [int]$CurrentRelease.tagName.split(".")[3]

$NewMinorVersionNumber = $MajorVersionNumber
$NewNormalVersionNumber = $NormalVersionNumber
$NewMajorVersionNumber = $MinorVersionNumber

switch ($Env:ReleaseType) {
  fix {
    $NewMinorVersionNumber = $MinorVersionNumber + 1
    Write-Output "::notice::Increasing minor version number from: $MinorVersionNumber to $NewMinorVersionNumber"
  }
  feat {
    $NewNormalVersionNumber = $NormalVersionNumber + 1
    Write-Output "::notice::Increasing middle version number from: $NormalVersionNumber to $NewNormalVersionNumber"
  }
  breaking {
    $NewMajorVersionNumber = $MajorVersionNumber + 1
    Write-Output "::notice::Increasing major version number from: $MajorVersionNumber to $NewMajorVersionNumber"
  }
}

$NewTagVersion = "$NewMajorVersionNumber.$NewNormalVersionNumber.$NewMinorVersionNumber"

Write-Output "::notice::New version is: $NewTagVersion"

Add-Content -Value "newVersionNumber=$NewTagVersion" -Path $Env:GITHUB_OUTPUT -Encoding utf8