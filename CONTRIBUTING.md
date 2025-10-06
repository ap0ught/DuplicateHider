# Contributing to DuplicateHider

Thank you for your interest in contributing to DuplicateHider! This document provides guidelines for contributing to the project.

## Development Setup

### Prerequisites

⚠️ **Windows Required**: This project targets .NET Framework 4.6.2, which is Windows-only. Development on Linux or macOS is not supported.

- **Windows** operating system
- **Visual Studio 2019 or later** (Community Edition is fine) OR **MSBuild**
- **.NET Framework 4.6.2 Developer Pack** ([Download](https://dotnet.microsoft.com/download/dotnet-framework/net462))
- **Playnite** installed (for testing)

### Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/YOUR-USERNAME/DuplicateHider.git`
3. Open `source/DuplicateHider.sln` in Visual Studio
4. Restore NuGet packages (Visual Studio will do this automatically)
5. Build the solution (F6 or Build → Build Solution)

**Alternative: Command Line Build**

```powershell
# Run the build script
.\build.ps1
```

Or manually:

```cmd
nuget restore source/DuplicateHider.sln
msbuild source/DuplicateHider.sln /p:Configuration=Release
```

### Extension Development Guidelines

This project follows the [Playnite Extension Development Guidelines](https://api.playnite.link/docs/tutorials/extensions/intro.html).

Key points:
- Follow the existing code style and patterns
- Test your changes thoroughly with Playnite
- Update documentation if you're adding new features
- Keep commits focused and well-documented

## Testing

To test your changes:

1. Build the extension in Release mode
2. The output will be in `source/bin/Release/`
3. Copy the extension files to your Playnite extensions directory:
   - Desktop: `%AppData%\Playnite\Extensions\`
   - Fullscreen: `%AppData%\Playnite\Extensions\`
4. Restart Playnite to load the updated extension

## Localization

For translations, please visit our [Crowdin project](https://crowdin.com/project/duplicatehider).

## Submitting Changes

1. Create a new branch for your feature: `git checkout -b feature/my-new-feature`
2. Make your changes and commit them with clear commit messages
3. Push to your fork: `git push origin feature/my-new-feature`
4. Open a Pull Request against the master branch

### Pull Request Guidelines

- Provide a clear description of the changes
- Reference any related issues
- Ensure the code builds without errors
- Test the extension in Playnite before submitting

## Code of Conduct

- Be respectful and constructive in discussions
- Help maintain a welcoming environment for all contributors
- Focus on what's best for the project and community

## Questions?

If you have questions, feel free to:
- [Open an issue on GitHub](https://github.com/Playnite/DuplicateHider/issues)
- Ask in the [Playnite Forum thread](https://playnite.link/forum/thread-308.html)

Thank you for contributing!
