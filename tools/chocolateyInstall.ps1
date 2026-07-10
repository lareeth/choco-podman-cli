$packageName    = 'podman-cli'
$url_amd64      = 'https://github.com/containers/podman/releases/download/v6.0.1/podman-remote-release-windows_amd64.zip'
$checksum_amd64 = '127d02930ac25c80088817502e833916cd3ee1ed1e771dbd42a4ce81b2e0d415'
$url_arm64      = 'https://github.com/containers/podman/releases/download/v6.0.1/podman-remote-release-windows_arm64.zip'
$checksum_arm64 = 'd3c2415f10772c55fc796c3b075e2e44720d3a60adaa05edbb7e1b2b8ac9cf85'
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
