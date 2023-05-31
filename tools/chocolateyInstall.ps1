$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v3.2.3/podman-remote-release-windows.zip'
$checksum       = '36a1fa45a19bc6c5722f418030be0f18a05e9b8d996832d0681097c7b5cac10c'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
