$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.8.1/podman-remote-release-windows_amd64.zip'
$checksum       = '3ea084728c923e35b0af79b830d35610dc319c1cc4a358864ec594d19325bf95'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
