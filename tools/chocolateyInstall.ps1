$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.2.0/podman-remote-release-windows_amd64.zip'
$checksum       = '9508f6052bc676d84229892c9620ea099aa08f98cede0a7bfdd43ec4b6982b3a'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
