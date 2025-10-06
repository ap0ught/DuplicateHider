# Instructions for Creating the First Release in ap0ught Repository

## Current State

The repository has been updated with:
- ✅ Corrected Playnite compatibility information (Playnite 9 and later)
- ✅ Updated all repository references from felixkmh to ap0ught
- ✅ Complete CHANGELOG with all historical versions
- ✅ Comprehensive release documentation

## Creating Your First Release

Since this PR only updates documentation without functional changes, you have two options:

### Option 1: Create a Documentation-Only Release (Recommended)

Release the current version (3.14.5) with updated documentation:

1. Merge this PR
2. Tag the commit:
   ```bash
   git tag -a v3.14.5-ap0ught -m "Re-release v3.14.5 with updated documentation"
   git push origin v3.14.5-ap0ught
   ```
3. This creates a release in the ap0ught repository with updated docs

### Option 2: Create a New Version Release

If you prefer a new version number (e.g., v3.15.0):

1. Merge this PR
2. Update `source/extension.yaml`:
   ```yaml
   Version: 3.15.0
   ```
3. Update `CHANGELOG.md`:
   ```markdown
   ## v3.15.0 (2024-XX-XX)
   
   ### Documentation
   
   - Updated README to reflect correct Playnite version compatibility
   - Updated all repository references from felixkmh to ap0ught
   - Repository has been transferred to ap0ught organization
   ```
4. Commit and push:
   ```bash
   git add source/extension.yaml CHANGELOG.md
   git commit -m "Bump version to v3.15.0"
   git push
   ```
5. Create and push tag:
   ```bash
   git tag -a v3.15.0 -m "Release v3.15.0"
   git push origin v3.15.0
   ```

## What Happens Next

GitHub Actions will automatically:
1. Build the extension
2. Create a `.pext` package
3. Publish a release at `https://github.com/ap0ught/DuplicateHider/releases`

## Future Releases

For all future releases, follow the instructions in `docs/RELEASE_GUIDE.md`.

## Notes

- The plugin ID remains `felixkmh_DuplicateHider_Plugin` for backward compatibility
- Users don't need to reinstall; updates will be automatic through Playnite
- Historical releases remain available at the original repository
