$packageName    = 'podman-cli'
$url_amd64      = 'https://github.com/podman-container-tools/podman/releases/download/v6.1.3/podman-remote-release-windows_amd64.zip'
$checksum_amd64 = 'bb98562f5faf0df3f28bab7fb517ea9e2d807817978bfa9f68982b75e6e59c40'
$url_arm64      = 'https://github.com/podman-container-tools/podman/releases/download/v6.1.3/podman-remote-release-windows_arm64.zip'
$checksum_arm64 = '77ca4314d1b5bc20f9fbb386bc22abef1634253b56bc6cc40558a3002596a8f3'
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
