$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.7.0/podman-remote-release-windows_amd64.zip'
$checksum       = 'ec5745a8e0adec14d8d9ff0df123951ff6a4035beb510100752e8bc73ca33cf0'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
