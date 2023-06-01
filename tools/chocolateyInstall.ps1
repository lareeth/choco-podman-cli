$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.3.0/podman-remote-release-windows_amd64.zip'
$checksum       = 'D20FC6B5D54453D238BD261773C286597168690A76204A274A7791527EE90AFA'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
