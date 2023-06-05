$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.4.0/podman-remote-release-windows_amd64.zip'
$checksum       = 'fc84934096dc4fca56197a447c831a65fd1d08e69eee7969187f92e6bbdd54e3'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
