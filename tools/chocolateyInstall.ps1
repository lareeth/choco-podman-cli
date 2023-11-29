$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.7.2/podman-remote-release-windows_amd64.zip'
$checksum       = 'f2b9ca34e54edc3a0d9fa4361e5cbfd309fa45dcf1a5561caf90f97978f56b62'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
