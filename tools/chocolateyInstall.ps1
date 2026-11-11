$packageName    = 'podman-cli'
$url_amd64      = 'https://github.com/podman-container-tools/podman/releases/download/v6.2.0/podman-remote-release-windows_amd64.zip'
$checksum_amd64 = 'c085a4860cadf8957aaee0b4693ea98117a908ce960aeb2a74d1570eba76aa88'
$url_arm64      = 'https://github.com/podman-container-tools/podman/releases/download/v6.2.0/podman-remote-release-windows_arm64.zip'
$checksum_arm64 = '8e0d15cd090c4749e70b33a7fc2dbc6dc90dad76d9392828b036fae26de2ba15'
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
