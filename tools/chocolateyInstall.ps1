$packageName    = 'podman-cli'
$url_amd64      = 'https://github.com/containers/podman/releases/download/v5.8.2/podman-installer-windows-amd64.msi'
$url_arm64      = 'https://github.com/containers/podman/releases/download/v5.8.2/podman-installer-windows-arm64.msi'
$checksum_amd64 = 'eda54f26f9695d198d9a679fa45ae24ba35b78444f432b5fe0c122c5a3624c57'
$checksum_arm64 = '77e9810e7598ef588b1fe7a850bf6baf572b30545dde82879a31638708c97bcd'
$checksumType   = 'sha256'
$validExitCodes = @(0)

$os = Get-WmiObject -Class Win32_OperatingSystem
if ($os.OSArchitecture -like "*ARM*") {
    $url = $url_arm64
    $checksum = $checksum_arm64
} else {
    $url = $url_amd64
    $checksum = $checksum_amd64
}

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'MSI'
  url64bit      = $url
  checksum64    = $checksum
  checksumType64= $checksumType
  silentArgs    = "/qn /norestart"
  validExitCodes= $validExitCodes
}

Install-ChocolateyPackage @packageArgs
