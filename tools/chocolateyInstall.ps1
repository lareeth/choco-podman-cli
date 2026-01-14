$packageName    = 'podman-cli'
$url_amd64      = 'https://github.com/containers/podman/releases/download/v5.7.0/podman-remote-release-windows_amd64.zip'
$url_arm64      = 'https://github.com/containers/podman/releases/download/v5.7.0/podman-remote-release-windows_arm64.zip'
$checksum_amd64 = 'b2f5b03b5e7a524f2c3a0bb2d44d4bb7de27633525b5ace45259e5d91fb31cdc'
$checksum_arm64 = 'b265e48afc5ce561ae95d28e7a877566c5e5ba8284e4ee5b12368c2d785e6ee1'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$os = Get-WmiObject -Class Win32_OperatingSystem
if ($os.OSArchitecture -like "*ARM*") {
    $url = $url_arm64
    $checksum = $checksum_arm64
} else {
    $url = $url_amd64
    $checksum = $checksum_amd64
}

Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
