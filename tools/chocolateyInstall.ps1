$packageName    = 'podman-cli'
$url_amd64      = 'https://github.com/containers/podman/releases/download/v6.0.2/podman-remote-release-windows_amd64.zip'
$checksum_amd64 = '2c055d363de03de917f79568a78b7d5902fc40453bbcc141ca18cf0a1fa1b78e'
$url_arm64      = 'https://github.com/containers/podman/releases/download/v6.0.2/podman-remote-release-windows_arm64.zip'
$checksum_arm64 = '7233d339236656eb95af07de532822e97c0a95b1e7ebc34bac11e695090259d6'
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
