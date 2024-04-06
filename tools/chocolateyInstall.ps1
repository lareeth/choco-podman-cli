$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.0.1/podman-remote-release-windows_amd64.zip'
$checksum       = '1fe87c4ed94397257debea29d743fc0ab1f1d586378ec7ed9f009484bef11639'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
