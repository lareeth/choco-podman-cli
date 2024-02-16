$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.9.2/podman-remote-release-windows_amd64.zip'
$checksum       = '8003d181859f213a8585cebb64afd96d784fbff9ce5c6199904f91e8980bc0f4'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
