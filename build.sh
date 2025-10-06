#!/bin/bash
# Build script for DuplicateHider
# This project requires Windows and .NET Framework 4.6.2

set -e

echo "================================"
echo "DuplicateHider Build Script"
echo "================================"
echo ""

# Check if running on Windows
if [[ "$OSTYPE" != "msys" && "$OSTYPE" != "win32" && "$OSTYPE" != "cygwin" ]]; then
    echo "ERROR: This project requires Windows to build."
    echo ""
    echo "Reason: DuplicateHider targets .NET Framework 4.6.2, which is Windows-only."
    echo ""
    echo "Solutions:"
    echo "  1. Build on a Windows machine using Visual Studio or MSBuild"
    echo "  2. Use GitHub Actions (automatic on push to master)"
    echo "  3. Use a Windows VM or container"
    echo ""
    echo "For CI/CD, ensure you use 'windows-latest' as the runner."
    echo "See .github/workflows/build.yml for the correct setup."
    echo ""
    exit 1
fi

echo "Platform check: Windows detected"
echo ""

# Check for MSBuild
if ! command -v msbuild &> /dev/null; then
    echo "ERROR: MSBuild not found in PATH."
    echo ""
    echo "Please install Visual Studio or MSBuild Tools:"
    echo "  https://visualstudio.microsoft.com/downloads/"
    echo ""
    exit 1
fi

echo "MSBuild found: $(msbuild -version | head -n 1)"
echo ""

# Check for NuGet
if ! command -v nuget &> /dev/null; then
    echo "WARNING: NuGet not found in PATH."
    echo "Attempting to use MSBuild's NuGet restore instead..."
    echo ""
fi

# Navigate to source directory
cd "$(dirname "$0")/source"

# Restore NuGet packages
echo "Restoring NuGet packages..."
if command -v nuget &> /dev/null; then
    nuget restore DuplicateHider.sln
else
    msbuild DuplicateHider.sln /t:Restore
fi
echo ""

# Build solution
echo "Building solution..."
msbuild DuplicateHider.sln /p:Configuration=Release /p:PostBuildEvent=""
echo ""

echo "================================"
echo "Build completed successfully!"
echo "Output location: source/bin/Release/"
echo "================================"
