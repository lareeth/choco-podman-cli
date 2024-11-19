$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.3.0/podman-remote-release-windows_amd64.zip'
$checksum       = '5a29fe087ddd9f6de677a16981f14059bb3e74a305a89a5974362856719c2f30'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
