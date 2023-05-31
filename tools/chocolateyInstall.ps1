$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v3.4.2/podman-remote-release-windows.zip'
$checksum       = 'fd7b7b8785cd605b38733b154cc90741bf9f67ed395162ab364a1761ea502db1'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
