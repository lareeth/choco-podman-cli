$packageName    = 'podman-cli'
$url_amd64      = 'https://github.com/containers/podman/releases/download/v5.7.1/podman-remote-release-windows_amd64.zip'
$url_arm64      = 'https://github.com/containers/podman/releases/download/v5.7.1/podman-remote-release-windows_arm64.zip'
$checksum_amd64 = 'ee25e6f47c0e0f67e30528ef5f797ab18f7c08c2dae175e6834bd8c14f60bf1e'
$checksum_arm64 = '487d216c459041acbb21abac9d285a5122a6de027fecfda107401502ca9087ff'
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
