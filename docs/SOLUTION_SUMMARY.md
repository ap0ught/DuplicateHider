# Solution Summary: Build Error on Linux

## Problem

The build error occurred when attempting to build DuplicateHider on a Linux system:

```
error MSB3644: The reference assemblies for .NETFramework,Version=v4.6.2 were not found.
```

The error was caused by running `dotnet build` on a Linux system, which cannot build .NET Framework projects.

## Root Cause

DuplicateHider targets **.NET Framework 4.6.2**, which is:
- Windows-only (not available on Linux or macOS)
- Not compatible with `dotnet build` on non-Windows platforms
- Requires MSBuild or Visual Studio to compile

This is a fundamental limitation of .NET Framework itself, not a project-specific issue.

## Solution Implemented

The solution focuses on **prevention and clear communication** rather than changing the project structure:

### 1. Build Helper Scripts

Created two build scripts that detect the environment and provide helpful error messages:

- **`build.ps1`** (PowerShell for Windows)
  - Detects Windows environment
  - Locates MSBuild automatically
  - Provides clear error messages if requirements are missing
  
- **`build.sh`** (Bash for Windows/Linux)
  - Detects non-Windows platforms and exits with helpful message
  - Works on Windows with Git Bash or WSL
  - Provides clear guidance on how to proceed

### 2. Documentation Updates

Updated all documentation to clearly communicate the Windows requirement:

- **README.md**: Added prominent warning section about Windows-only builds
- **CONTRIBUTING.md**: Updated prerequisites with platform requirements
- **docs/DEVELOPMENT.md**: Added detailed platform and build requirements
- **docs/QUICK_START.md**: Enhanced troubleshooting section with Linux error explanation
- **docs/BUILD_REQUIREMENTS.md**: NEW - Comprehensive guide covering:
  - Why Windows is required
  - Alternative options for non-Windows users
  - Common build errors and solutions
  - GitHub Actions configuration

### 3. Key Changes Summary

All documentation now includes:
- ⚠️ Clear warnings about Windows-only requirement
- Explanation of why .NET Framework 4.6.2 requires Windows
- Alternative solutions (GitHub Actions, VM, pre-built releases)
- Correct build commands (MSBuild, not dotnet build)
- Troubleshooting for the specific error seen

## Why Not Port to .NET Core/.NET 5+?

**Answer**: DuplicateHider is a plugin for Playnite, which targets .NET Framework 4.6.2. Plugins must match the host application's framework for compatibility. This is not something that can be changed without Playnite itself changing.

## For CI/CD Systems

GitHub Actions and other CI/CD systems must use **Windows runners** to build this project:

```yaml
jobs:
  build:
    runs-on: windows-latest  # ✅ Correct
    # runs-on: ubuntu-latest  # ❌ Will fail
```

The existing `.github/workflows/build.yml` and `.github/workflows/release.yml` are already correctly configured with `windows-latest`.

## Testing the Solution

The build scripts were tested on Linux and correctly provide this error message:

```
================================
DuplicateHider Build Script
================================

ERROR: This project requires Windows to build.

Reason: DuplicateHider targets .NET Framework 4.6.2, which is Windows-only.

Solutions:
  1. Build on a Windows machine using Visual Studio or MSBuild
  2. Use GitHub Actions (automatic on push to master)
  3. Use a Windows VM or container

For CI/CD, ensure you use 'windows-latest' as the runner.
See .github/workflows/build.yml for the correct setup.
```

## Benefits

1. **Prevention**: Build scripts catch the error before MSBuild is invoked
2. **Clear Guidance**: Helpful error messages guide users to solutions
3. **Documentation**: All docs now clearly state Windows requirement
4. **Minimal Changes**: No changes to project structure or build system
5. **Backward Compatible**: Existing builds on Windows continue to work unchanged

## Files Changed

- `build.ps1` (new) - PowerShell build script with environment detection
- `build.sh` (new) - Bash build script with environment detection
- `README.md` - Added Windows requirement warning and build instructions
- `CONTRIBUTING.md` - Updated prerequisites with platform requirements
- `docs/DEVELOPMENT.md` - Enhanced build section with platform details
- `docs/QUICK_START.md` - Improved troubleshooting section
- `docs/BUILD_REQUIREMENTS.md` (new) - Comprehensive build guide

## Conclusion

The issue is now addressed through clear documentation and helpful tooling. Users attempting to build on non-Windows systems will receive immediate, actionable feedback explaining why the build cannot proceed and what alternatives are available.
