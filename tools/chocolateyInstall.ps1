$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.5.2/podman-remote-release-windows_amd64.zip'
$checksum       = '2e63aa82cf0b57305e3b8074cf46c09eab85d04bfa81330697dc07d127b2197a'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
