$packageName    = 'podman-cli'
$url            = 'https://github.com/lareeth/podman-cli-builder/releases/download/v1.8.0-rc1/podman-remote-release-windows.zip'
$checksum       = 'd0f9f909615c61aa96bb37b30211b7a237602e1451d44a89bf94159572975543'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
