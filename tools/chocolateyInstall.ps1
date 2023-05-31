$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v3.3.1/podman-remote-release-windows.zip'
$checksum       = '683f1d8b2491e39bf10fa3148b518b6009ebfce523271dfb68bb136c70d725fa'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
