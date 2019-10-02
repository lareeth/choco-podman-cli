$packageName    = 'podman-cli'
$url            = 'https://storage.cloud.google.com/libpod-master-releases/podman-remote-v1.6.0-28-gdac7889d-master-windows-amd64.zip?authuser=0'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir"
