$packageName    = 'podman-cli'
$url            = 'https://github.com/lareeth/podman-cli-builder/releases/download/v1.6.0/podman-remote-v1.6.0-windows.zip'
$checksum       = 'b503b2022df857b8bb6cd00891db625f4737fc27d54da883873229037a4acdb2'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
