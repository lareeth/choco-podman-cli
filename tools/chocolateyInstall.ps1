$packageName    = 'podman-cli'
$url_amd64      = 'https://github.com/containers/podman/releases/download/v6.1.0/podman-remote-release-windows_amd64.zip'
$checksum_amd64 = 'cc6a454fdace55eeb2587834c498fd6ab55eb1b298127a9fcc5432daeab7e4f9'
$url_arm64      = 'https://github.com/containers/podman/releases/download/v6.1.0/podman-remote-release-windows_arm64.zip'
$checksum_arm64 = 'eef5a13d05673e894cfd8ab198248a4718bdacac6da21eb03dcfc72c02db2e6f'
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
