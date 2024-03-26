$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.0.0/podman-remote-release-windows_amd64.zip'
$checksum       = '9a0bcbf11b165c6221da30ec1ea41414d7a818f61723114ad2fba40abc40ef0c'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
