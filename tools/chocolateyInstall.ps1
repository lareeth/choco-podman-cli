$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.2.3/podman-remote-release-windows_amd64.zip'
$checksum       = 'a383383046b4bb995e68c6e2a1ba19f0359160c6ea519b5fc8ef717ffae877d9'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
