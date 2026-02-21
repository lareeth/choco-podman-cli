$packageName    = 'podman-cli'
$url_amd64      = 'https://github.com/containers/podman/releases/download/v5.8.0/podman-remote-release-windows_amd64.zip'
$url_arm64      = 'https://github.com/containers/podman/releases/download/v5.8.0/podman-remote-release-windows_arm64.zip'
$checksum_amd64 = '5d88d730f9963c3cfabae4c8e688a025f59cd5ff045878506e3955b004eeb522'
$checksum_arm64 = '43608836a0e9977acc0316dbd180fef68779d308aff21bd34ae91f01e9984041'
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
