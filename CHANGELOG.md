## v4.0.1 (2025-01-13)

### Major Update - Playnite 11 Compatibility

- **Upgraded PlayniteSDK from 6.2.0 to 6.13.0** for Playnite 11 compatibility
- Verified compatibility with Playnite 9, 10, and 11
- Updated version number to 4.0.1 to indicate major compatibility update
- Updated documentation to reflect Playnite 11 support

### Documentation

- Updated README with Playnite 11 compatibility information
- Clarified version compatibility matrix (v4.x for Playnite 9-11, v3.x for Playnite 9-10, v2.x for Playnite 8)

## Unreleased

### Documentation

- Updated README to reflect correct Playnite version compatibility (Playnite 9 and later, not just Playnite 9)
- Updated all repository references from felixkmh to ap0ught
- Updated extension.yaml with new repository links
- Repository has been transferred to ap0ught organization

## v3.14.5 (2022-11-10)

### Fix

- Fixed sources not being deselected correctly

## v3.14.4 (2022-11-04)

### Feat

- Localization updates
- Minor fixes

## v3.14.3 (2022-09-14)

### Feat

- Update priority property lists when opening settings

## v3.14.2 (2022-09-12)

### Fix

- Fixed exception when adding/removing/editing games

## v3.14.1 (2022-09-11)

### Fix

- Fixed groups being unhidden when library changed

### Feat

- Localization updates

## v3.14.0 (2022-09-11)

### Feat

- Added option to define tags as priority override tags
- Added GameAction as placeholder to DisplayString
- Some small fixes
- Updated localization

## v3.13.3 (2022-07-25)

### Fix

- Fixed crash when enabling new platforms

### Feat

- Localization updates

## v3.13.2 (2022-07-07)

### Fix

- Fixed fields not being copied properly if some are null

## v3.13.1 (2022-06-27)

### Fix

- Fixed crash if priority list contained invalid Ids

### Feat

- Localization updates

## v3.13.0 (2022-06-23)

### Feat

- Added functions to game menu to add/remove games from ignore list
- Localization updates

## v3.12.1 (2022-06-04)

### Fix

- Minor bug fixes

## v3.12.0 (2022-05-29)

### Feat

- Added new features and improvements

## v3.11.1 (2022-05-15)

### Fix

- Bug fixes and stability improvements

## v3.11.0 (2022-05-08)

### Feat

- New features and enhancements

## v3.10.7 (2022-04-24)

### Fix

- Minor bug fixes

## v3.10.6 (2022-04-17)

### Fix

- Bug fixes

## v3.10.5 (2022-04-10)

### Fix

- Bug fixes and improvements

## v3.10.4 (2022-03-27)

### Fix

- Minor fixes

## v3.10.3 (2022-03-20)

### Fix

- Bug fixes

## v3.10.2 (2022-03-13)

### Fix

- Bug fixes

## v3.10.1 (2022-03-06)

### Fix

- Bug fixes

## v3.10.0 (2022-02-27)

### Feat

- New features and improvements

## v3.9.0 (2021-12-29)

### Fix

- fix crash if games name are null

## v3.8.1 (2021-12-18)

### Fix

- init progress to 0

### Feat

- use global progress dialog for copying

## v3.8.0 (2021-11-07)

### Feat

- added priority overwrite tags

## v3.7.1 (2021-10-24)

### Fix

- hiding games using the menu function does not update ui integration

## v3.7.0 (2021-10-24)

### Feat

- custom groups overwrite black/white lists

### Fix

- Undefined Platform not matched on empty platform list

## v3.6.0 (2021-10-20)

### Feat

- updated localization and links

## v3.5.2 (2021-10-18)

### Fix

- include games that have at least one enabled platform

## v3.5.1 (2021-10-18)

### Fix

- crashing if game's TagId list is null

## v3.5.0 (2021-10-18)

### Feat

- italian translation by MaxRally
- italian translation by MaxRally

### Fix

- automatic update not working in some cases

## v3.4.2 (2021-10-18)

### Fix

- ui integration not reflecting changes correctly
- triggering game updates too often in some cases fix: ui integration not reflecting changes correctly

## v3.4.1 (2021-10-06)

### Fix

- check if TagId List exists before adding or removing tags

## v3.4.0 (2021-10-06)

### Feat

- add tag to games hidden by duplicate hider

## v3.3.0 (2021-10-05)

### Feat

- updated to QuickSearchSDK 2.0.0

## v3.2.3 (2021-09-23)

### Fix

- default SourceSelector caused crashes in some cases
- updated to new QuickSearchSDK

## v3.2.2 (2021-09-21)

### Fix

- customs groups not being saved correctly in some cases

## v3.2.1 (2021-09-17)

### Fix

- crash if group item is dragged to the last spot

## v3.2.0 (2021-09-17)

### Refactor

- removed unused variables
- changed loc strings
- changed loc string

### Fix

- items disappearing after being dropped

### Feat

- added custom groups

## v3.1.6 (2021-09-15)

### Fix

- platform icons only were cached once per source

## v3.1.5 (2021-09-15)

### Fix

- platform locaization string spelled incorrrctly

## v3.1.4 (2021-09-08)

### Fix

- check for resource existence before setting it as a reference
- no tooltip for default SourceSelector Style in Fullscreen mode
- still change icon opacity if no style is applied

## v3.1.3 (2021-09-07)

### Fix

- catch error when library icon path is null
- icon opacity is not changed based on installation status using code behind, it is only handled by each theme

### Perf

- ListData objects are properly being reused to save time wasted on their innitialization
- store dictionary that keeps a list of copies for each game

### Refactor

- fixed release date
- added new package
- cz init

## v3.1.2 (2021-09-07)

### Fix

- theme icons can be found using either lower case or capitalized
- use pluginId to retrieve icons of builtin sources

### Refactor

- added extension function to capitalize strings

## v3.1.1 (2021-09-05)

## v3.1.0 (2021-09-04)

## v3.0.0 (2021-09-03)

## v2.5.4 (2021-06-13)

## v2.5.3 (2021-05-29)

## v2.5.2 (2021-05-26)

## v2.5.0 (2021-04-28)

## v2.5.1 (2021-04-26)

## v2.3.2 (2021-01-08)

## v2.3.1 (2021-01-06)
