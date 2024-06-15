$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.1.1/podman-remote-release-windows_amd64.zip'
$checksum       = 'fd9441cb427a9338e013b95516ce113110e22bbea9dc0876715afd8d581d519b'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
