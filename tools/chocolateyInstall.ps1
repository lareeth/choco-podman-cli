$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v3.3.0/podman-remote-release-windows.zip'
$checksum       = 'c64b50b80ac170645d59f3df750a4b833d362e5bf01baa67b2fe3f45b7cae565'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
