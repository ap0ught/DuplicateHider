# Release Guide for DuplicateHider

This guide explains how to create a new release of DuplicateHider in the ap0ught repository.

## Prerequisites

- You have maintainer access to the repository
- You have git configured with push access
- All code changes are committed and pushed to the main branch

## Release Process

### 1. Decide on Version Number

Follow [Semantic Versioning](https://semver.org/):
- **Major version (x.0.0)**: Breaking changes or major rewrites
- **Minor version (3.x.0)**: New features, backward compatible
- **Patch version (3.14.x)**: Bug fixes, backward compatible

### 2. Update Version in Code

Edit `source/extension.yaml` and update the version number:

```yaml
Version: 3.15.0  # Update this line
```

### 3. Update CHANGELOG.md

Edit `CHANGELOG.md`:

1. Change the "Unreleased" section header to the new version with date:
   ```markdown
   ## v3.15.0 (2024-XX-XX)
   ```

2. Ensure changes are properly categorized under:
   - `### Feat` - New features
   - `### Fix` - Bug fixes
   - `### Documentation` - Documentation updates
   - `### Refactor` - Code refactoring
   - `### Breaking` - Breaking changes

3. Add a new "Unreleased" section at the top for future changes

### 4. Commit Version Bump

```bash
git add source/extension.yaml CHANGELOG.md
git commit -m "Bump version to v3.15.0"
git push origin master  # or main, depending on default branch
```

### 5. Create and Push Git Tag

```bash
# Create an annotated tag
git tag -a v3.15.0 -m "Release v3.15.0"

# Push the tag to GitHub
git push origin v3.15.0
```

### 6. GitHub Actions Takes Over

Once the tag is pushed, GitHub Actions will automatically:

1. Trigger the release workflow (`.github/workflows/release.yml`)
2. Build the extension on Windows
3. Package it as `felixkmh_DuplicateHider_Plugin_3_15_0.pext`
4. Create a GitHub release with the package attached
5. Publish it at `https://github.com/ap0ught/DuplicateHider/releases`

You can monitor the progress at:
`https://github.com/ap0ught/DuplicateHider/actions`

### 7. Verify the Release

1. Go to `https://github.com/ap0ught/DuplicateHider/releases`
2. Verify the release was created with the correct version
3. Download the `.pext` file and verify it's not corrupted
4. Optionally test the extension in Playnite

### 8. Add Release Notes (Optional)

You can edit the release on GitHub to add more detailed release notes:

1. Go to the release page
2. Click "Edit release"
3. Add detailed description from CHANGELOG
4. Add any additional notes for users

## Example Complete Release

Here's a complete example of releasing version 3.15.0:

```bash
# 1. Update version in source/extension.yaml (manually)
# 2. Update CHANGELOG.md (manually)

# 3. Commit changes
git add source/extension.yaml CHANGELOG.md
git commit -m "Bump version to v3.15.0"
git push origin master

# 4. Create and push tag
git tag -a v3.15.0 -m "Release v3.15.0"
git push origin v3.15.0

# 5. Wait for GitHub Actions to complete
# 6. Verify at https://github.com/ap0ught/DuplicateHider/releases
```

## Repository Transfer Notes

**Important**: This repository was transferred from `felixkmh/DuplicateHider` to `ap0ught/DuplicateHider`.

- Historical releases (up to v3.14.5) are available at the original repository
- New releases (v3.15.0+) will be published in this repository
- The plugin ID remains `felixkmh_DuplicateHider_Plugin` for backward compatibility
- Users can continue to use the same plugin without reinstallation

## Troubleshooting

### Release workflow fails

1. Check the GitHub Actions logs
2. Common issues:
   - Build errors: Fix the code and create a new patch version
   - Permission errors: Ensure GitHub Actions has write permissions
   - Package errors: Verify the build output directory structure

### Tag already exists

If you need to re-release the same version:

```bash
# Delete local tag
git tag -d v3.15.0

# Delete remote tag
git push origin :refs/tags/v3.15.0

# Create new tag
git tag -a v3.15.0 -m "Release v3.15.0"
git push origin v3.15.0
```

**Note**: Avoid re-tagging if the release has already been published and downloaded by users.

## Contact

For questions about releases, open an issue at:
https://github.com/ap0ught/DuplicateHider/issues
