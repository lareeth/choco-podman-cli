$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.8.3/podman-remote-release-windows_amd64.zip'
$checksum       = '80d06960ef05f8102b9f8c4f59ad2fa41e360ae9dcf003bc0f002de2e8f0c8b8'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
