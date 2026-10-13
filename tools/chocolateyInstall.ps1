$packageName    = 'podman-cli'
$url_amd64      = 'https://github.com/podman-container-tools/podman/releases/download/v6.1.4/podman-remote-release-windows_amd64.zip'
$checksum_amd64 = '8b70cd2511bfac9b65e58858d8fe54eeb68e3420eeb600e3f869b9a4b8576572'
$url_arm64      = 'https://github.com/podman-container-tools/podman/releases/download/v6.1.4/podman-remote-release-windows_arm64.zip'
$checksum_arm64 = '7987844d58b8d0320de94260d5b3cb414ef7f92db93986f6819f7e36fac125d6'
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
