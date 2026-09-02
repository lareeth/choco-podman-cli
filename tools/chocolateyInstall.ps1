$packageName    = 'podman-cli'
$url_amd64      = 'https://github.com/podman-container-tools/podman/releases/download/v6.1.1/podman-remote-release-windows_amd64.zip'
$checksum_amd64 = '68766f21aebec379ec34cfee46d0550b025ec6d79c02fbdcb61a80bc7191ef01'
$url_arm64      = 'https://github.com/podman-container-tools/podman/releases/download/v6.1.1/podman-remote-release-windows_arm64.zip'
$checksum_arm64 = 'd2f399ba0d7ca9805d32e356f5228ef76bf2ad8aeea5eadef974e155f19701b4'
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
