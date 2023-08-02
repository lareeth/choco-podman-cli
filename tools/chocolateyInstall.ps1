$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.6.0/podman-remote-release-windows_amd64.zip'
$checksum       = 'b8620399fe04ea8d7a6c6438e5cfa65f88a24f8a84a942d278d841082f37276b'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
