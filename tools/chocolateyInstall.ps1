$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v3.4.0/podman-remote-release-windows.zip'
$checksum       = '861c646462388b031afec62adef61f1faf22a3cf6962bbe6ead7a418976a6864'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
