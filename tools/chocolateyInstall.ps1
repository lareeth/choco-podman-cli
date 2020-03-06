$packageName    = 'podman-cli'
$url            = 'https://github.com/lareeth/podman-cli-builder/releases/download/v1.6.3/podman-remote-v1.6.3-windows.zip'
$checksum       = '362fdef73c6edfe5824ed961e7b84a458606e48e49fc19307ecf82ee8a1984f8'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
