# DuplicateHider Development Guide

This guide provides detailed information for developers working on the DuplicateHider extension.

## Architecture

DuplicateHider is a Generic Plugin extension for Playnite that follows the [Playnite SDK architecture](https://api.playnite.link/docs/tutorials/extensions/intro.html).

### Key Components

1. **DuplicateHiderPlugin.cs** - Main plugin class implementing `GenericPlugin` and `IStartPageExtension`
2. **DuplicateHiderSettings.cs** - Settings management and UI
3. **UiIntegration.cs** - Custom UI elements for theme integration
4. **Models/** - Data models and view models
5. **Controls/** - Custom WPF controls (SourceSelector, DHContentControl, etc.)

## Extension Structure

```
DuplicateHider/
├── source/
│   ├── DuplicateHider.csproj     # Project file
│   ├── extension.yaml             # Extension manifest
│   ├── DuplicateHiderPlugin.cs   # Main plugin class
│   ├── DuplicateHiderSettings.cs # Settings implementation
│   ├── Controls/                  # Custom UI controls
│   ├── Models/                    # Data models
│   ├── ViewModels/               # View models
│   ├── Views/                     # XAML views
│   └── Localization/             # Translation files
└── README.md
```

## Playnite SDK Integration

### Plugin Interface

The extension implements the following Playnite SDK interfaces:

- `GenericPlugin` - Base plugin functionality
- `IStartPageExtension` - Custom start page views
- `ISettings` - Settings persistence

### Key SDK Features Used

1. **Game Menu Items** - Custom context menu entries for games
2. **Main Menu Items** - Custom menu entries in Playnite's main menu
3. **Custom UI Elements** - Theme integration through custom controls
4. **Settings Support** - Configuration UI and persistence
5. **Database Access** - Reading and modifying game library data

## Development Workflow

### 1. Setting Up Development Environment

⚠️ **Windows Required**: This project targets .NET Framework 4.6.2, which is Windows-only. Building on Linux or macOS is not supported. Do not attempt to build with `dotnet build` on non-Windows systems.

**Prerequisites:**
- Windows operating system
- .NET Framework 4.6.2 Developer Pack ([Download](https://dotnet.microsoft.com/download/dotnet-framework/net462))
- Visual Studio 2019 or later (or MSBuild)

```bash
# Clone the repository
git clone https://github.com/ap0ught/DuplicateHider.git
cd DuplicateHider

# Open in Visual Studio
start source/DuplicateHider.sln
```

### 2. Building

**Using the build script (recommended):**

```powershell
# PowerShell
.\build.ps1
```

```bash
# Bash (Git Bash on Windows)
./build.sh
```

**Manual build:**

```bash
# Restore NuGet packages
nuget restore source/DuplicateHider.sln

# Build with MSBuild
msbuild source/DuplicateHider.sln /p:Configuration=Release
```

**Important Notes:**
- Do NOT use `dotnet build` - this project requires MSBuild and .NET Framework
- The project uses the old-style .csproj format (not SDK-style)
- GitHub Actions automatically builds on `windows-latest` runners

### 3. Testing

1. Build the extension in Debug or Release mode
2. Output is generated in `source/bin/Debug/` or `source/bin/Release/`
3. Copy the output directory to Playnite extensions folder:
   - `%AppData%\Playnite\Extensions\felixkmh_DuplicateHider_Plugin\`
4. Restart Playnite to load the extension

### 4. Debugging

To debug the extension:

1. Build in Debug configuration
2. In Visual Studio, go to Project Properties → Debug
3. Set "Start external program" to your Playnite.DesktopApp.exe path
4. Set breakpoints and press F5 to start debugging

## Best Practices

### Following Playnite Guidelines

According to the [Playnite Extension Documentation](https://api.playnite.link/docs/tutorials/extensions/intro.html):

1. **Use appropriate API versions** - Always specify the minimum required SDK version in extension.yaml
2. **Handle async operations properly** - UI operations should not block
3. **Dispose resources** - Properly dispose of database connections and UI resources
4. **Follow naming conventions** - Use clear, descriptive names for classes and methods
5. **Localization** - Support multiple languages through resource files

### Code Style

- Follow C# naming conventions
- Use meaningful variable and method names
- Add XML documentation comments for public APIs
- Keep methods focused and small
- Use async/await for long-running operations

### Performance Considerations

1. **Cache data when possible** - Avoid repeated database queries
2. **Use background threads** - Don't block the UI thread
3. **Lazy loading** - Load data only when needed
4. **Dispose properly** - Clean up resources to prevent memory leaks

## Extension Manifest (extension.yaml)

The extension.yaml file contains metadata about the extension:

```yaml
Id: felixkmh_DuplicateHider_Plugin
Name: DuplicateHider
Author: felixkmh
Version: x.x.x
Module: DuplicateHider.dll
Type: GenericPlugin
Icon: icon.png
Links:
  - Name: GitHub
    Url: https://github.com/ap0ught/DuplicateHider
```

Key fields:
- **Id**: Unique identifier (should not change)
- **Version**: Semantic versioning (major.minor.patch)
- **Module**: DLL filename
- **Type**: GenericPlugin, MetadataPlugin, or LibraryPlugin

## UI Integration

### Custom Controls

DuplicateHider provides custom UI elements for theme integration:

1. **DuplicateHider_SourceSelector** - Displays game source icons
2. **DuplicateHider_ContentControl** - Interactive game copy selector

### Theme Integration Guidelines

Theme creators can integrate DuplicateHider controls in their XAML:

```xml
<ContentControl x:Name="DuplicateHider_SourceSelector" 
                DockPanel.Dock="Right" 
                MaxHeight="{Binding ElementName=PART_ImageIcon, Path=Height}"/>
```

See [Theme Integration](../README.md#theme-integration) for detailed examples.

## Testing

### Manual Testing Checklist

- [ ] Extension loads without errors
- [ ] Settings page displays correctly
- [ ] Game hiding/revealing works as expected
- [ ] Priority system functions properly
- [ ] Custom groups work correctly
- [ ] UI integration elements display properly
- [ ] Localization strings display correctly

### Test Scenarios

1. **Fresh Installation** - Test with a clean Playnite installation
2. **Large Libraries** - Test with libraries containing thousands of games
3. **Multiple Sources** - Test with games from various sources (Steam, GOG, Epic, etc.)
4. **Theme Compatibility** - Test with different themes
5. **Settings Migration** - Test upgrading from previous versions

## Continuous Integration

The project uses GitHub Actions for CI/CD:

- **Build Workflow** (`.github/workflows/build.yml`) - Builds on every push
- **Release Workflow** (`.github/workflows/release.yml`) - Creates releases from tags

## Releasing

To create a new release of DuplicateHider:

1. **Update version number** in `source/extension.yaml`
2. **Update CHANGELOG.md**:
   - Change "Unreleased" section to the new version with date
   - Add appropriate categorization (Feat, Fix, Documentation, etc.)
3. **Commit changes**:
   ```bash
   git add source/extension.yaml CHANGELOG.md
   git commit -m "Bump version to v3.x.x"
   git push
   ```
4. **Create and push a version tag**:
   ```bash
   git tag -a v3.x.x -m "Release v3.x.x"
   git push origin v3.x.x
   ```
5. **GitHub Actions will automatically**:
   - Build the extension
   - Package it as `felixkmh_DuplicateHider_Plugin_3_x_x.pext`
   - Create a GitHub release with the package attached
   - The release will be available at `https://github.com/ap0ught/DuplicateHider/releases`

**Note**: The plugin ID remains `felixkmh_DuplicateHider_Plugin` for backward compatibility, even though the repository is now under the ap0ught organization.

## Resources

- [Playnite SDK Documentation](https://api.playnite.link/)
- [Playnite Extension Tutorials](https://api.playnite.link/docs/tutorials/extensions/intro.html)
- [Playnite GitHub Repository](https://github.com/JosefNemec/Playnite)
- [DuplicateHider Forum Thread](https://playnite.link/forum/thread-308.html)

## Getting Help

- Open an issue on [GitHub](https://github.com/ap0ught/DuplicateHider/issues)
- Ask in the [Playnite Forum](https://playnite.link/forum/thread-308.html)
- Check the [Playnite SDK Documentation](https://api.playnite.link/)
