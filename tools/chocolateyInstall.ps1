$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.1.0/podman-remote-release-windows_amd64.zip'
$checksum       = '72a55aea3c9a6e0e86be3cecaa36e15324e7bd669272a0f1c3ac6cf7af35c932'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
