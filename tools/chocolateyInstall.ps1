$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.8.2/podman-remote-release-windows_amd64.zip'
$checksum       = '9195be198f7a3a53e5e9fb6c43b7105d1e8440da9372da20fb6cabaa330f0766'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
