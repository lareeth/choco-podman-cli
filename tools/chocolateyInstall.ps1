$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v3.4.3/podman-remote-release-windows.zip'
$checksum       = '8caef1892eb95aa08614918b0c69d6caac40a7126b567b0990d50b450ef98f4b'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
