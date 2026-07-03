$packageName    = 'podman-cli'
$url_amd64      = 'https://github.com/containers/podman/releases/download/v6.0.0/podman-remote-release-windows_amd64.zip'
$url_arm64      = 'https://github.com/containers/podman/releases/download/v6.0.0/podman-remote-release-windows_arm64.zip'
$checksum_amd64 = '5f94d7248cc2c304a46b275ba3af895d024d381fbe3633814660ef1f5899c767'
$checksum_arm64 = '68e222311e9e9a55afb76726aadb609797b840ac4d6a64b1b46bea98a6b11e89'
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
