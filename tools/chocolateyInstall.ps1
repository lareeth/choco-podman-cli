$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.1.0-rc1/podman-remote-release-windows_amd64.zip'
$checksum       = '03a1b266822c4e0d0b0d8a03bef283f6c0a1bcc41479c4774bcd7edd26259d77'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
