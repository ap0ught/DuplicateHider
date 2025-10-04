# Copilot Instructions for DuplicateHider

## Project Overview

DuplicateHider is a plugin/extension for [Playnite](https://github.com/JosefNemec/Playnite/), a video game library manager. This plugin automatically hides duplicate copies of games from different sources (Steam, GOG, Epic, etc.) based on configurable priority rules.

## Technology Stack

- **Language**: C# (.NET Framework 4.6.2)
- **UI Framework**: WPF (XAML)
- **Build System**: MSBuild
- **Package Manager**: NuGet
- **Dependencies**: PlayniteSDK 6.2.0, Newtonsoft.Json 10.0.3, gong-wpf-dragdrop 2.4.1
- **License**: MIT

## Architecture

- **Plugin Type**: GenericPlugin
- **Main Entry Point**: `DuplicateHiderPlugin.cs`
- **Settings**: `DuplicateHiderSettings.cs` and `DuplicateHiderSettingsView.xaml`
- **UI Integration**: Custom controls in `Controls/` directory (SourceSelector, DHContentControl, DHWrapper)
- **Localization**: XAML resource files in `Localization/` directory
- **Theme Integration**: Examples in `UiIntegrationExamples/` directory

## Coding Conventions

### C# Style
- Use PascalCase for public members, methods, and classes
- Use camelCase for private fields and local variables
- Prefer explicit types over `var` when the type is not obvious
- Follow existing patterns for extension methods in `Extensions.cs`
- Use LINQ where appropriate but prefer readability

### XAML Style
- Follow WPF naming conventions (x:Name with PascalCase)
- Keep XAML files organized with appropriate spacing
- Use data binding and MVVM patterns where applicable
- Custom controls follow the naming pattern `DuplicateHider_*`

### Error Handling
- Handle null cases explicitly
- Use appropriate exception handling for database operations
- Log errors when appropriate using PlayniteAPI logging

## Key Concepts

### Game Prioritization
Games are prioritized using a scoring system:
```csharp
Score(game) = Priority(game.Source) - priorityList.Count * IsInstalled(game)?1:0
```
Lower scores indicate higher priority. Installed games always get higher priority.

### Duplicate Detection
- Games are grouped by normalized names
- The plugin maintains an index of game copies
- Hidden state is managed automatically based on priority scores
- Ignored games list excludes specific games from processing

### UI Integration
- Provides custom WPF controls for theme developers
- SourceSelector displays icons for different game sources
- ContentControl shows available game copies with interaction support
- Theme icons can be customized by users

## Important File Locations

- **Main Plugin**: `source/DuplicateHiderPlugin.cs`
- **Settings**: `source/DuplicateHiderSettings.cs`
- **Extensions**: `source/Extensions.cs`
- **UI Controls**: `source/Controls/`
- **Converters**: `source/Converters/`
- **Filters**: `source/Filters/`
- **Localization**: `source/Localization/`
- **Extension Metadata**: `source/extension.yaml`

## Development Guidelines

### When Making Changes

1. **Respect the Playnite SDK**: This is a plugin that extends Playnite, so all interactions with the game library must go through the PlayniteAPI
2. **Maintain Compatibility**: Version 3.x.x targets Playnite 9 specifically
3. **Preserve Theme Integration**: Custom controls are used by theme developers - don't break existing integrations
4. **Handle Localization**: String resources are in `Localization/` - use `ResourceProvider.GetString()`
5. **Consider Performance**: The plugin processes entire game libraries - optimize for large collections

### Testing Considerations

- This project does not have automated tests
- Manual testing requires Playnite installation
- Test with multiple game sources (Steam, GOG, Epic, etc.)
- Verify theme integration doesn't break
- Check localization strings are properly resolved

### Build Process

- Build using MSBuild with target framework .NET Framework 4.6.2
- Post-build event uses Playnite Toolbox to pack the extension
- Output goes to `bin/` directory
- Extension resources are copied to output with PreserveNewest

## Common Tasks

### Adding New Features
1. Consider impact on existing priority system
2. Update settings if configuration needed
3. Add localization strings for new UI elements
4. Update README.md with new features
5. Maintain backward compatibility with existing settings

### Modifying UI Controls
1. Update XAML in `Controls/` directory
2. Update corresponding code-behind (.cs files)
3. Consider theme developer impact
4. Test with example themes in `UiIntegrationExamples/`

### Working with Game Data
1. Use PlayniteAPI.Database.Games for game access
2. Subscribe to item update events for reactive updates
3. Handle game collection changes efficiently
4. Respect ignored games list and filters

## External Resources

- [Playnite SDK Documentation](https://api.playnite.link/)
- [Playnite Forum Thread](https://playnite.link/forum/thread-308.html)
- [GitHub Repository](https://github.com/felixkmh/DuplicateHider)
- [Crowdin Translations](https://crowdin.com/project/duplicatehider)

## Notes for AI Assistants

- This is a mature project with existing users - prioritize stability
- The plugin has theme integration features that external developers rely on
- Always check README.md for feature documentation and examples
- Icon resources are embedded in the assembly from `icons/` directory
- User-specified icons go in a special folder accessed via settings
- The project uses both event-driven and polling patterns for updates
