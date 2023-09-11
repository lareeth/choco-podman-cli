$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.6.2/podman-remote-release-windows_amd64.zip'
$checksum       = '476c7a9810b8e372e0ec6e704e949fbdd4cdf8df402b9e18d6d8ec8af45fdea0'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
