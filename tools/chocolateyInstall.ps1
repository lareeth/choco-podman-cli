$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.5.0/podman-remote-release-windows_amd64.zip'
$checksum       = '581233ef18a049c3cfea23025a183e94459154136293bfaf1515882c62689da6'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
