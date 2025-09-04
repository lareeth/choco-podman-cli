$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.6.1/podman-remote-release-windows_amd64.zip'
$checksum       = '339056bdc02a96fe2ae9554b7083c960f81c2007ef6b02d2514722c0665ea4f9'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
