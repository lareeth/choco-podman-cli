$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.2.5/podman-remote-release-windows_amd64.zip'
$checksum       = 'ec14bd2f64140854b8a92194c5fc6aad3be04b20e5468d70ddf1a4264c14c102'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
