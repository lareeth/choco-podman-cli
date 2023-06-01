$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.2.1/podman-remote-release-windows_amd64.zip'
$checksum       = 'd6f894217437004a11cfef20415d990cd5ba6acb6223926cf3c1e546346827f6'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
