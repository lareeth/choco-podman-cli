Import-Module Chocolatey-AU

# global
$headers = @{}
$script:PackageName = 'podman-cli'
$script:MovedNuspecAlias = $false

# NOTE: Chocolatey-AU resolves <folderName>.nuspec before au_GetLatest runs.
# This repo folder is choco-podman-cli, but the package nuspec is podman-cli.nuspec.
# We create a temporary alias nuspec for AU discovery, then sync changes back.

function Initialize-NuspecAlias {
    $folderName = Split-Path -Leaf $PSScriptRoot
    $script:ExpectedNuspecPath = Join-Path $PSScriptRoot ("{0}.nuspec" -f $folderName)
    $script:CanonicalNuspecPath = Join-Path $PSScriptRoot ("{0}.nuspec" -f $script:PackageName)

    if (-not (Test-Path $script:CanonicalNuspecPath)) {
        throw "Required nuspec file not found: $script:CanonicalNuspecPath"
    }

    if ($script:ExpectedNuspecPath -eq $script:CanonicalNuspecPath) {
        return
    }

    if ((Test-Path $script:ExpectedNuspecPath) -and (Test-Path $script:CanonicalNuspecPath)) {
        Remove-Item -Path $script:ExpectedNuspecPath -Force
    }

    if (Test-Path $script:CanonicalNuspecPath) {
        Move-Item -Path $script:CanonicalNuspecPath -Destination $script:ExpectedNuspecPath -Force
        $script:MovedNuspecAlias = $true
    }
}

function Sync-NuspecAlias {
    if (-not $script:ExpectedNuspecPath -or -not $script:CanonicalNuspecPath) {
        return
    }

    if (($script:ExpectedNuspecPath -ne $script:CanonicalNuspecPath) -and (Test-Path $script:ExpectedNuspecPath)) {
        if ($script:MovedNuspecAlias) {
            Move-Item -Path $script:ExpectedNuspecPath -Destination $script:CanonicalNuspecPath -Force
        }
        elseif (-not (Test-Path $script:CanonicalNuspecPath)) {
            Copy-Item -Path $script:ExpectedNuspecPath -Destination $script:CanonicalNuspecPath -Force
        }
    }
}

function Get-GitHubLatestRelease($project, $tagPrefix, [switch] $newest) {

    # Use a token if provided to avoid hitting GitHub API rate limits. The token only needs "public_repo" scope.
    $token = $env:github_api_key
    $script:headers = @{
        'User-Agent' = 'chocolatey-au'
    }
    if ($token) {
        $script:headers['Authorization'] = ("token {0}" -f $token)
    }
    else {
        Write-Warning "No auth token"
    }

    $releasesUrl = "https://api.github.com/repos/$project/releases"

    if ($newest.IsPresent) {
        $releases = Invoke-RestMethod -Method Get -Uri "$releasesUrl" -Headers $headers
        $releases | Select-Object -First 1
    }
    elseif ($tagPrefix) {
        $releases = Invoke-RestMethod -Method Get -Uri "$releasesUrl" -Headers $headers
        $releases | Where-Object { $_.tag_name -and $_.tag_name.StartsWith($tagPrefix) } | Select-Object -First 1

    }
    else {
        Invoke-RestMethod -Method Get -Uri "$releasesUrl/latest" -Headers $headers
    }
}

function Get-GitHubReleaseAssets($release) {
    Invoke-RestMethod -Method Get -Uri "$($release.assets_url)?per_page=100" -Headers $script:headers
}

function Get-ReleaseVersion($release, [string] $prefix) {
    if ($prefix) {
        if ($release.name -and $release.name.StartsWith($prefix)) {
            $release.name.Substring($prefix.Length)
        }
        elseif ($release.tag_name -and $release.tag_name.StartsWith($prefix)) {
            $release.tag_name.Substring($prefix.Length)
        }
        else {
            return $null
        }
        # Prefer tag_name
    }
    elseif ($release.tag_name) {
        $release.tag_name
    }
    elseif ($release.name) {
        $release.name
    }
}

function global:au_SearchReplace {
    $activeNuspec = Split-Path -Leaf $script:ExpectedNuspecPath

    @{
        'tools\chocolateyinstall.ps1'   = @{
            "(\t*url_amd64\s*=\s*)('.*')"          = "`$1'$($Latest.Url64)'"
            "(\t*url_arm64\s*=\s*)('.*')"          = "`$1'$($Latest.UrlArm64)'"
            "(\t*checksum_amd64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
            "(\t*checksum_arm64\s*=\s*)('.*')"     = "`$1'$($Latest.ChecksumArm64)'"
            "(\t*checksumType_amd64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64Type)'"
            "(\t*checksumType_arm64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumArm64Type)'"
        }
        $activeNuspec = @{
            "(?s)(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }
    }
}
    
function global:au_GetLatest {
    # This repo has releases for the cli tool as well as VS Code vsix
    $release = Get-GitHubLatestRelease "containers/podman"

    $version = Get-ReleaseVersion -release $release -prefix "v"

    # Convert semver2 to semver1
    $version = $version.Replace("-beta.", "-beta").Replace("-rc.", "-rc")

    if (-not $version) {
        Write-Warning "Couldn't find version number"
        return "Ignore"
    }
    
    $assets = Get-GitHubReleaseAssets $release
    $amd64Asset = $assets | Where-Object { $_.name -eq "podman-remote-release-windows_amd64.zip" }
    $arm64Asset = $assets | Where-Object { $_.name -eq "podman-remote-release-windows_arm64.zip" }
    $url64 = $amd64Asset.browser_download_url
    $urlArm64 = $arm64Asset.browser_download_url

    # digest = "sha256:a836d0ee038db37fe6686a1d8b894bffb3b8288b857d3248b2f91597567611ad"
    ($checksum64type, $checksum64) = $amd64Asset.digest.split(":")
    ($checksumArm64type, $checksumArm64) = $arm64Asset.digest.split(":")

    $Latest = @{
        PackageName       = $script:PackageName
        Version           = $version
        Url64             = $url64
        UrlArm64          = $urlArm64
        Checksum64        = $checksum64
        ChecksumArm64     = $checksumArm64
        Checksum64Type    = $checksum64type
        ChecksumArm64Type = $checksumArm64type
        ReleaseNotes      = $release.html_url
    }
    return $Latest
}

Initialize-NuspecAlias

try {
    update -ChecksumFor none -NoReadme
}
finally {
    Sync-NuspecAlias
}
