$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.6.2/podman-remote-release-windows_amd64.zip'
$checksum       = '9c86b2686dabc287af1de1b4fadc506310718bf84fccbd12f0831fc7726a7cd5'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
