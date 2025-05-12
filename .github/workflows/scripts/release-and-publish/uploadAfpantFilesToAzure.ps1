New-Item -Path "./" -Name "actions-tmp" -ItemType "Directory"
New-Item -Path "./actions-tmp" -Name "xslt" -ItemType "Directory"
New-Item -Path "./actions-tmp" -Name "xsd" -ItemType "Directory"
New-Item -Path "./actions-tmp" -Name "xml" -ItemType "Directory"
Get-ChildItem -Path 'spesifikasjoner/afpant/' -Recurse -Include *.xslt | ForEach-Object -Process { Copy-Item $_.VersionInfo.FileName ./actions-tmp/xslt/ }
Get-ChildItem -Path 'spesifikasjoner/afpant/' -Recurse -Include *.xsd | ForEach-Object -Process { Copy-Item $_.VersionInfo.FileName ./actions-tmp/xsd }
Get-ChildItem -Path 'spesifikasjoner/afpant/' -Recurse -Include *.xml | ForEach-Object -Process { Copy-Item $_.VersionInfo.FileName ./actions-tmp/xml }
Get-ChildItem -Path 'actions-tmp' -Recurse | ForEachObject -Process { Write-Output "::notice::Uploading file: $_.Name" }