$packageName    = 'podman-cli'
$url_amd64      = 'https://github.com/podman-container-tools/podman/releases/download/v6.1.2/podman-remote-release-windows_amd64.zip'
$checksum_amd64 = '98c309e1cba4f36fc89a0819607de0696d52f0dcc0c5ef3a8d5cd87fdcf062ba'
$url_arm64      = 'https://github.com/podman-container-tools/podman/releases/download/v6.1.2/podman-remote-release-windows_arm64.zip'
$checksum_arm64 = '9c652543765737d22692023e682b1dea0be72bc4dc93d1d3c940718c689360dd'
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
