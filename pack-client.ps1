param(
    [Parameter(Mandatory = $true)]
    [string]$OutputPath,
    [string]$PackDirectory = (Join-Path $PSScriptRoot 'client-pack')
)

$ErrorActionPreference = 'Stop'
$manifestPath = Join-Path $PackDirectory 'manifest.json'
$modListPath = Join-Path $PackDirectory 'modlist.html'
$overridesPath = Join-Path $PackDirectory 'overrides'

foreach ($requiredPath in @($manifestPath, $modListPath, $overridesPath)) {
    if (-not (Test-Path -LiteralPath $requiredPath)) {
        throw "Required pack input is missing: $requiredPath"
    }
}

$manifest = Get-Content -LiteralPath $manifestPath -Raw | ConvertFrom-Json
if ($manifest.manifestType -ne 'minecraftModpack' -or $manifest.manifestVersion -ne 1) {
    throw 'Unsupported CurseForge manifest format.'
}
if ($manifest.minecraft.version -ne '1.12.2') {
    throw "Unexpected Minecraft version: $($manifest.minecraft.version)"
}
if (-not $manifest.files -or $manifest.files.Count -eq 0) {
    throw 'The manifest has no mod download entries.'
}

$resolvedOutput = [System.IO.Path]::GetFullPath($OutputPath)
$resolvedParent = Split-Path -Parent $resolvedOutput
New-Item -ItemType Directory -Path $resolvedParent -Force | Out-Null
if (Test-Path -LiteralPath $resolvedOutput) {
    Remove-Item -LiteralPath $resolvedOutput -Force
}

Compress-Archive -Path (Join-Path $PackDirectory '*') -DestinationPath $resolvedOutput -CompressionLevel Optimal

$archive = [System.IO.Compression.ZipFile]::OpenRead($resolvedOutput)
try {
    $entryNames = @($archive.Entries | ForEach-Object FullName)
    foreach ($requiredEntry in @('manifest.json', 'modlist.html')) {
        if ($entryNames -notcontains $requiredEntry) {
            throw "Archive is missing root file: $requiredEntry"
        }
    }
    if (-not ($entryNames | Where-Object { $_ -like 'overrides/*' })) {
        throw 'Archive is missing the overrides directory.'
    }
    if ($entryNames | Where-Object { $_ -match '\.(exe|dll)$' }) {
        throw 'Launcher or native binary found in the archive.'
    }
    if ($entryNames | Where-Object { $_ -match '\.jar$' }) {
        throw 'Mod JAR found in the CurseForge source package.'
    }
} finally {
    $archive.Dispose()
}

$hash = Get-FileHash -LiteralPath $resolvedOutput -Algorithm SHA256
Write-Output "Created $resolvedOutput"
Write-Output "Mod entries: $($manifest.files.Count)"
Write-Output "SHA256: $($hash.Hash)"
