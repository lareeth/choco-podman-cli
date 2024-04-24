$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.0.2/podman-remote-release-windows_amd64.zip'
$checksum       = '672b8f64416928b69d535932da6ff4d63560e6435f7ea2f66dcaff093ee9c61a'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
