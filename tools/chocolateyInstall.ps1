$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v3.4.4/podman-remote-release-windows.zip'
$checksum       = '49e276543affe6f7435d4fb83b98a7b58cfcf544df61c95be4e5e78b34686044'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
