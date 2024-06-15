$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.1.0/podman-remote-release-windows_amd64.zip'
$checksum       = '8e41862ebe5acaac703176d9e862600efef588976e3a40efb96e73c7198ec1e3'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
