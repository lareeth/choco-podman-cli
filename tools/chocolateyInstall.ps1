$packageName    = 'podman-cli'
$url_amd64      = 'https://github.com/containers/podman/releases/download/v5.8.2/podman-remote-release-windows_amd64.zip'
$url_arm64      = 'https://github.com/containers/podman/releases/download/v5.8.2/podman-remote-release-windows_arm64.zip'
$checksum_amd64 = '1b60aae4bd4879c3932c283d2070bb87116ec1f0ab3a4a98eff7e65f318f9e4e'
$checksum_arm64 = '06c64d11267232ba21d3e43962c0e9036f24550d87fb811bc995195d82c32fca'
$checksumType_amd64   = 'sha256'
$checksumType_arm64   = 'sha256'
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$os = Get-WmiObject -Class Win32_OperatingSystem
if ($os.OSArchitecture -like "*ARM*") {
    $url = $url_arm64
    $checksum = $checksum_arm64
    $checksumType = $checksumType_arm64
} else {
    $url = $url_amd64
    $checksum = $checksum_amd64
    $checksumType = $checksumType_amd64
}

Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
