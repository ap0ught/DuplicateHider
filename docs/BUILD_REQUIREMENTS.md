# Build Requirements

## Platform Requirements

⚠️ **Windows Only**: DuplicateHider targets .NET Framework 4.6.2, which is **Windows-only**. 

### Why Windows Only?

.NET Framework 4.6.2 is a Windows-specific framework that:
- Is not available on Linux or macOS
- Cannot be built with `dotnet build` on non-Windows platforms
- Requires MSBuild or Visual Studio to compile

This is a limitation of the .NET Framework itself, not this project.

### Alternative Options

If you don't have access to Windows:
1. **Use GitHub Actions**: The project has automated builds on Windows runners
2. **Use a Windows VM**: Run Windows in VirtualBox, Parallels, or similar
3. **Use Windows Subsystem for Linux (WSL)**: Note that even with WSL, you still need Windows
4. **Wait for builds**: Download pre-built releases from the [Releases page](https://github.com/ap0ught/DuplicateHider/releases)

## Required Software

### On Windows:

1. **Windows 10 or later** (or Windows Server 2016+)

2. **.NET Framework 4.6.2 Developer Pack**
   - Download: https://dotnet.microsoft.com/download/dotnet-framework/net462
   - This includes reference assemblies needed for compilation

3. **Build Tools** (choose one):
   - **Option A**: Visual Studio 2019 or later
     - Download: https://visualstudio.microsoft.com/downloads/
     - Community Edition is free and sufficient
   - **Option B**: MSBuild without Visual Studio
     - Download: https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2019
     - Select "Build Tools for Visual Studio"

4. **NuGet** (usually included with Visual Studio)
   - Standalone: https://www.nuget.org/downloads
   - Used to restore package dependencies

## Build Methods

### Method 1: Using the Build Scripts (Recommended)

The repository includes build scripts that check your environment and provide helpful error messages:

**PowerShell:**
```powershell
.\build.ps1
```

**Bash (Git Bash on Windows):**
```bash
./build.sh
```

### Method 2: Visual Studio

1. Open `source/DuplicateHider.sln`
2. Let Visual Studio restore NuGet packages (automatic)
3. Press F6 or go to Build → Build Solution

### Method 3: Command Line with MSBuild

```cmd
REM Restore packages
nuget restore source/DuplicateHider.sln

REM Build
msbuild source/DuplicateHider.sln /p:Configuration=Release
```

## Common Build Errors

### Error: "The reference assemblies for .NETFramework,Version=v4.6.2 were not found"

**Cause**: 
- Building on a non-Windows system, OR
- Missing .NET Framework 4.6.2 Developer Pack on Windows

**Solution**:
- If on Linux/macOS: Use a Windows system or VM
- If on Windows: Install the [.NET Framework 4.6.2 Developer Pack](https://dotnet.microsoft.com/download/dotnet-framework/net462)

### Error: "MSBuild not found" or "'msbuild' is not recognized"

**Cause**: MSBuild is not in your PATH or not installed

**Solution**:
- Install Visual Studio or Build Tools for Visual Studio
- Add MSBuild to your PATH
- Use the build scripts which can locate MSBuild automatically

### Error: "Package restore failed"

**Cause**: NuGet packages couldn't be downloaded

**Solution**:
- Check your internet connection
- Ensure NuGet is installed
- Clear NuGet cache: `nuget locals all -clear`
- Retry: `nuget restore source/DuplicateHider.sln`

## GitHub Actions / CI

The project uses GitHub Actions for automated builds:

- **Build Workflow** (`.github/workflows/build.yml`): 
  - Runs on every push and pull request
  - Uses `windows-latest` runner
  - Automatically restores packages and builds

- **Release Workflow** (`.github/workflows/release.yml`):
  - Runs when version tags are pushed
  - Uses `windows-latest` runner
  - Creates release artifacts

**Important**: Any CI/CD system must use Windows runners. Linux runners will fail with the error about missing .NET Framework reference assemblies.

### Example GitHub Actions Configuration

```yaml
jobs:
  build:
    runs-on: windows-latest  # Must be Windows
    
    steps:
    - uses: actions/checkout@v4
    
    - name: Setup MSBuild
      uses: microsoft/setup-msbuild@v1.1
      
    - name: Restore packages
      run: nuget restore source/DuplicateHider.sln
      
    - name: Build
      run: msbuild source/DuplicateHider.sln /p:Configuration=Release
```

## Do NOT Use

❌ **Do not use `dotnet build`**: This project is not compatible with the `dotnet` CLI

❌ **Do not use Linux/macOS**: .NET Framework 4.6.2 is Windows-only

❌ **Do not use .NET Core/.NET 5+**: This project specifically requires .NET Framework

## Why Not Migrate to .NET Core/.NET 5+?

DuplicateHider is a plugin for Playnite, which itself targets .NET Framework. The plugin must match the framework used by Playnite to ensure compatibility. Playnite 9 uses .NET Framework 4.6.2, so this plugin must as well.

## Additional Resources

- [Playnite SDK Documentation](https://api.playnite.link/)
- [.NET Framework Downloads](https://dotnet.microsoft.com/download/dotnet-framework)
- [MSBuild Documentation](https://docs.microsoft.com/visualstudio/msbuild/)
- [Visual Studio Downloads](https://visualstudio.microsoft.com/downloads/)
