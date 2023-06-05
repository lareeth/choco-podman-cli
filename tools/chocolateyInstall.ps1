$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.4.1/podman-remote-release-windows_amd64.zip'
$checksum       = '829c923f60930bc56ef8986dbe4f05e715037d8194ff4ffca749cd05483e123f'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
