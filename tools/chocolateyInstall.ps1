$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.3.2/podman-remote-release-windows_amd64.zip'
$checksum       = '837e7f4732ea259d3bc099c8a87cb93f56d1621c594e1c826f2ad64397bef035'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
