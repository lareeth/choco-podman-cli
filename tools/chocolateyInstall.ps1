$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v3.2.1/podman-remote-release-windows.zip'
$checksum       = 'a62cf8cd55e04b4b43c3cbfc96d6bab336647246cdffb923539ca8751fd14814'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
