$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.3.1/podman-remote-release-windows_amd64.zip'
$checksum       = '975b54832daec8536caad066538f9270e16b5561c4da344cfc0eecb5127f0a06'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
