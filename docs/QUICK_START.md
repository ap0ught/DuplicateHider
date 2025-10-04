# Quick Start Guide

Get up and running with DuplicateHider development in minutes!

## Prerequisites

- [Visual Studio 2019 or later](https://visualstudio.microsoft.com/) (Community Edition is fine)
- [.NET Framework 4.6.2 Developer Pack](https://dotnet.microsoft.com/download/dotnet-framework/net462)
- [Playnite](https://playnite.link/) installed for testing

## 5-Minute Setup

### 1. Clone the Repository

```bash
git clone https://github.com/felixkmh/DuplicateHider.git
cd DuplicateHider
```

### 2. Open in Visual Studio

```bash
start source/DuplicateHider.sln
```

Or double-click `source/DuplicateHider.sln` in Windows Explorer.

### 3. Restore Packages

In Visual Studio:
1. Right-click the solution in Solution Explorer
2. Select "Restore NuGet Packages"

Or from command line:
```bash
cd source
nuget restore DuplicateHider.sln
```

### 4. Build

Press **F6** or go to **Build → Build Solution**

### 5. Test

1. Build in **Release** mode (Ctrl+Shift+B)
2. Output will be in `source/bin/Release/`
3. Copy all files from Release folder to:
   ```
   %AppData%\Playnite\Extensions\felixkmh_DuplicateHider_Plugin\
   ```
4. Restart Playnite

## Quick Reference

### Project Structure

```
DuplicateHider/
├── source/                        # Source code
│   ├── DuplicateHider.sln        # Visual Studio solution
│   ├── DuplicateHider.csproj     # Project file
│   ├── extension.yaml             # Extension manifest
│   ├── DuplicateHiderPlugin.cs   # Main plugin class
│   ├── Controls/                  # Custom UI controls
│   ├── Models/                    # Data models
│   └── Views/                     # XAML views
├── docs/                          # Documentation
├── UiIntegrationExamples/        # Theme integration examples
└── README.md                      # Main documentation
```

### Key Files

- **extension.yaml** - Extension metadata (ID, version, author, etc.)
- **DuplicateHiderPlugin.cs** - Main plugin implementation
- **DuplicateHiderSettings.cs** - Settings UI and persistence

### Common Tasks

#### Build Release Version
```bash
msbuild source/DuplicateHider.sln /p:Configuration=Release
```

#### Run Tests
Install the extension in Playnite and verify:
- Extension loads without errors
- Settings page opens
- Game hiding/revealing works
- UI integration displays correctly

#### Debug
1. Set Playnite.DesktopApp.exe as startup program in project properties
2. Set breakpoints
3. Press F5 to start debugging

## Next Steps

- Read the [Development Guide](DEVELOPMENT.md) for detailed information
- Check [Contributing Guidelines](../CONTRIBUTING.md) before submitting PRs
- Join the discussion in the [Playnite Forum](https://playnite.link/forum/thread-308.html)

## Troubleshooting

### Build Errors

**"The reference assemblies for .NETFramework,Version=v4.6.2 were not found"**
- Install [.NET Framework 4.6.2 Developer Pack](https://dotnet.microsoft.com/download/dotnet-framework/net462)

**"Package restore failed"**
- Check internet connection
- Update NuGet Package Manager in Visual Studio
- Try: `nuget restore source/DuplicateHider.sln`

**"PlayniteSDK not found"**
- Restore NuGet packages
- Check that NuGet sources include nuget.org

### Runtime Errors

**Extension doesn't load in Playnite**
- Check Playnite logs at `%AppData%\Playnite\playnite.log`
- Verify all DLLs are copied to the extension folder
- Ensure extension.yaml is in the folder

**Settings page doesn't open**
- Check for exceptions in Playnite logs
- Verify XAML files are copied to output directory

## Getting Help

- **Documentation**: [docs/](.)
- **Issues**: [GitHub Issues](https://github.com/felixkmh/DuplicateHider/issues)
- **Forum**: [Playnite Forum Thread](https://playnite.link/forum/thread-308.html)
- **Playnite Docs**: [Extension Development](https://api.playnite.link/docs/tutorials/extensions/intro.html)

Happy coding! 🚀
