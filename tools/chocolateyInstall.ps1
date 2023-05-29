$packageName    = 'podman-cli'
$url            = 'https://github.com/lareeth/podman-cli-builder/releases/download/v1.8.2/podman-remote-release-windows.zip'
$checksum       = 'e9974388d7c1f792fcd8e6feb4ad0ccd9e9976005da53e4bfba5a488831db2a2'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
