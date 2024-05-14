$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.0.3/podman-remote-release-windows_amd64.zip'
$checksum       = '23c6b2176ab4deca077c91073de0d80f0bd204dbe9d4c6afacde0db44d8067ce'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
