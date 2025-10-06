# Build script for DuplicateHider
# This project requires Windows and .NET Framework 4.6.2

$ErrorActionPreference = "Stop"

Write-Host "================================" -ForegroundColor Cyan
Write-Host "DuplicateHider Build Script" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# Check if running on Windows
if (-not $IsWindows -and $PSVersionTable.PSVersion.Major -ge 6) {
    Write-Host "ERROR: This project requires Windows to build." -ForegroundColor Red
    Write-Host ""
    Write-Host "Reason: DuplicateHider targets .NET Framework 4.6.2, which is Windows-only." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Solutions:" -ForegroundColor Yellow
    Write-Host "  1. Build on a Windows machine using Visual Studio or MSBuild"
    Write-Host "  2. Use GitHub Actions (automatic on push to master)"
    Write-Host "  3. Use a Windows VM or container"
    Write-Host ""
    Write-Host "For CI/CD, ensure you use 'windows-latest' as the runner." -ForegroundColor Yellow
    Write-Host "See .github/workflows/build.yml for the correct setup." -ForegroundColor Yellow
    Write-Host ""
    exit 1
}

Write-Host "Platform check: Windows detected" -ForegroundColor Green
Write-Host ""

# Find MSBuild
$msbuildPath = & "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe" `
    -latest -requires Microsoft.Component.MSBuild -find MSBuild\**\Bin\MSBuild.exe `
    -prerelease 2>$null | Select-Object -First 1

if (-not $msbuildPath) {
    # Try to find MSBuild in PATH
    $msbuildPath = Get-Command msbuild -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source
}

if (-not $msbuildPath) {
    Write-Host "ERROR: MSBuild not found." -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Visual Studio or MSBuild Tools:" -ForegroundColor Yellow
    Write-Host "  https://visualstudio.microsoft.com/downloads/" -ForegroundColor Cyan
    Write-Host ""
    exit 1
}

Write-Host "MSBuild found: $msbuildPath" -ForegroundColor Green
Write-Host ""

# Check for NuGet
$nugetPath = Get-Command nuget -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source

if (-not $nugetPath) {
    Write-Host "WARNING: NuGet not found in PATH." -ForegroundColor Yellow
    Write-Host "Attempting to use MSBuild's NuGet restore instead..." -ForegroundColor Yellow
    Write-Host ""
}

# Navigate to source directory
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location (Join-Path $scriptPath "source")

# Restore NuGet packages
Write-Host "Restoring NuGet packages..." -ForegroundColor Cyan
if ($nugetPath) {
    & nuget restore DuplicateHider.sln
} else {
    & $msbuildPath DuplicateHider.sln /t:Restore
}
Write-Host ""

# Build solution
Write-Host "Building solution..." -ForegroundColor Cyan
& $msbuildPath DuplicateHider.sln /p:Configuration=Release /p:PostBuildEvent=""

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "================================" -ForegroundColor Green
    Write-Host "Build completed successfully!" -ForegroundColor Green
    Write-Host "Output location: source\bin\Release\" -ForegroundColor Cyan
    Write-Host "================================" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "Build failed with exit code $LASTEXITCODE" -ForegroundColor Red
    exit $LASTEXITCODE
}
