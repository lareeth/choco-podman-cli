$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.4.3/podman-remote-release-windows_amd64.zip'
$checksum       = 'c74cb8f0ea46837dd427bda872777c52b577d40740081d032568230a5677d4f7'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
