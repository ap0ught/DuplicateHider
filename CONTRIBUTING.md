# Contributing to DuplicateHider

Thank you for your interest in contributing to DuplicateHider! This document provides guidelines for contributing to the project.

## Development Setup

### Prerequisites

- Visual Studio 2019 or later (or MSBuild/MonoDevelop)
- .NET Framework 4.6.2 Developer Pack
- Playnite installed (for testing)

### Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/YOUR-USERNAME/DuplicateHider.git`
3. Open `source/DuplicateHider.sln` in Visual Studio
4. Restore NuGet packages
5. Build the solution

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
- Open an issue on GitHub
- Ask in the [Playnite Forum thread](https://playnite.link/forum/thread-308.html)

Thank you for contributing!
