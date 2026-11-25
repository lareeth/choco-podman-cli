$packageName    = 'podman-cli'
$url_amd64      = 'https://github.com/podman-container-tools/podman/releases/download/v6.2.1/podman-remote-release-windows_amd64.zip'
$checksum_amd64 = 'a42468966997bade4e161b8a5aac96f757f4f88e5d5aa8a4ccaa4e3c089bd55d'
$url_arm64      = 'https://github.com/podman-container-tools/podman/releases/download/v6.2.1/podman-remote-release-windows_arm64.zip'
$checksum_arm64 = '56fc19da947fbc62deaaf55ff09acb8607c017ee068f2cee879122a5d02bd15d'
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
