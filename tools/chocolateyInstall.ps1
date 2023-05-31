$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v3.2.0/podman-remote-release-windows.zip'
$checksum       = '8a351029130c738adcbb1e5ca4c1faa995d0b2750d662c5d131017ca1782b460'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
