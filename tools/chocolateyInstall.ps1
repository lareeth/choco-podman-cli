$packageName    = 'podman-cli'
$url_amd64      = 'https://github.com/containers/podman/releases/download/v5.8.3/podman-remote-release-windows_amd64.zip'
$url_arm64      = 'https://github.com/containers/podman/releases/download/v5.8.3/podman-remote-release-windows_arm64.zip'
$checksum_amd64 = 'dd8af942c6226f1e1aec0d1534bf5224ce00f7bdcdeb7c6ca9621343bb5130e5'
$checksum_arm64 = 'f3914bb468a06409ce84a97f102ed810636ce90d8876831a9561179a1f4d699f'
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
