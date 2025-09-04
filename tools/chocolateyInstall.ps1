$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.6.0/podman-remote-release-windows_amd64.zip'
$checksum       = '9de9df4c83530b8e008528df96a4526f5f697dbdb287d5307e561698afb91bd4'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
