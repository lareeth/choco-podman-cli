$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.3.1/podman-remote-release-windows_amd64.zip'
$checksum       = '6a12bf736a58aaa1bdd1c54ff378ce4a868eaba4ba747121150dc0e4843cca1e'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
