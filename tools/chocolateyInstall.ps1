$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.4.4/podman-remote-release-windows_amd64.zip'
$checksum       = 'c25868810836fa80bd49dc3b3970555e017aa184e7a623bb1fde165bcc7e3024'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
