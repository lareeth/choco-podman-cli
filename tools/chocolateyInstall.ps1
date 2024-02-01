$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.9.1/podman-remote-release-windows_amd64.zip'
$checksum       = '68a5aa4dea1a2c8eccf10d4ab870dad74e1a2fb8519aee000ac29e28ea62010d'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
