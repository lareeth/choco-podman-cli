$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v3.2.2/podman-remote-release-windows.zip'
$checksum       = '935193dd613620b047fce77156cff19087bdb1cdd75d031cb92ab522ffbdf5d7'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
