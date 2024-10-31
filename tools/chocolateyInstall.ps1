$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.3.0-rc2/podman-remote-release-windows_amd64.zip'
$checksum       = 'f1db4465c11bb95a8543d50f1622532ae23352770385ecc33455d03ecc3ed104'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
