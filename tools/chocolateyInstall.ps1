$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.4.0/podman-remote-release-windows_amd64.zip'
$checksum       = '0eb2a34db3f5ec55529eb91b963bca4bbc8d7b5a8480700c77dc359bdb51b87e'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
