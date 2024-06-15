$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.9.5/podman-remote-release-windows_amd64.zip'
$checksum       = '4ba1b288ac6a0d3371cd694eb8930f0e9f72f24a8bf5328ca31a099284571627'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
