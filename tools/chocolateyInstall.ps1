$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v3.0.1/podman-remote-release-windows.zip'
$checksum       = '71133cdcfcaffc3ff6781d0cdeacaf6f55cc8e2619f69927e89991dc71e4125d'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
