$packageName    = 'podman-cli'
$url_amd64      = 'https://github.com/containers/podman/releases/download/v5.8.1/podman-remote-release-windows_amd64.zip'
$url_arm64      = 'https://github.com/containers/podman/releases/download/v5.8.1/podman-remote-release-windows_arm64.zip'
$checksum_amd64 = '1c0255c38982a1494205bde6f6e5cafcfdca25a64b9fd36510bc45e7c32495b7'
$checksum_arm64 = '6b8794086ac15da544dba156056ac0a7364eb12fa94edc26125ad681229a1138'
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
