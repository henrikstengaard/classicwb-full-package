# ClassicWB FULL Package

ClassicWB FULL is a feature rich Workbench enhancement by Bloodwych targeted A1200 with 4MB memory expansion using 16 colour screenmode using PAL / NTSC / Non-Interlaced 640x256 display.

## Description

ClassicWB FULL Package contains ClassicWB FULL v28 created by Bloodwych from EAB.

With permission from Bloodwych it has been converted to a package for HstWB Installer.

Original version of ClassicWB FULL can be downloaded from http://classicwb.abime.net/.

## Requirements

ClassicWB FULL package can be installed on any Amiga with Amiga OS 3.2, 3.1.4 or 3.1 and about 69MB free space on a harddrive for installation.

## Installation

Download latest release from https://github.com/henrikstengaard/classicwb-full-package/releases and copy it to HstWB Installer "packages" directory, which typically is "c:\Program Files (x86)\HstWB Installer\Packages".

Installation through HstWB Installer will install and configure ClassicWB FULL package using defined assigns.
During installation dialogs are presented to customize ClassicWB installation.

## Assigns

Installation of ClassicWB FULL package requires and uses following assign and default value:

- SYSTEMDIR: = DH0:

ClassicWB FULL files will be installed and configured in SYSTEMDIR: assign, which must be set to harddrive containing Workbench.

## Modifications

ClassicWB is installed from a zip file containing all files from ClassicWB System.hdf.

The install script for HstWB Installer is based on S/Startup-Sequence from ClassicWB System.hdf with following changes:

- Removed Workbench installation.
- Paths has been changed: SYS: to SYSTEMDIR:, C: to SYSTEMDIR:C/, L: to SYSTEMDIR:L/.
- Modified versions of Temp enable and disable option scripts with changed paths.
- Removed all "press enter to continue" expect last one used after installation complete message is shown.
- Removed and reduced waits.
- Adjusted text spacing.
- Creates backup of startup sequence as "S:Startup-Sequence.BAK".
- Creates backup of user startup as "S:User-Startup.BAK". 
- Creates backup of original ClassicWB FULL startup sequence as "S:Startup-Sequence.CWB".
- Creates backup of original ClassicWB FULL user startup as "S:User-Startup.CWB". 
- Patch startup sequence and user startup with ClassicWB FULL changes for best Amiga OS compatibility with existing and future versions.
- Added support for Amiga OS 3.2 and 3.1.4:
  - Reinstalled MUI to fix Scalos prefs and iGame.
  - Disabled PatchRAM, StackAttack, FBlit and FText.
  - Patched Scalos title to 3.1.4 for no theme, Oldicons, Retro and ReGen themes.
  - Disable Scalos option to fix NewIcons shown garbled or distorted, which will add following as a replacement for Scalos:
    - Full Palette for better colors in icons.
    - Tools Daemon for added options in Workbench top menu.
    - Magic Menu for right click menu in Wokrbench.
  - Disabled Copper, BorderBlank, StackAttack.

## Screenshots

Screenshots of ClassicWB FULL installed with Amiga OS 3.2.

![ClassicWB FULL 3.2 1](screenshots/classicwb_full_3.2_1.png?raw=true)

![ClassicWB FULL 3.2 2](screenshots/classicwb_full_3.2_2.png?raw=true)

Screenshots of ClassicWB FULL installed with Amiga OS 3.1.4.

![ClassicWB FULL 3.1.4 1](screenshots/classicwb_full_3.1.4_1.png?raw=true)

![ClassicWB FULL 3.1.4 2](screenshots/classicwb_full_3.1.4_2.png?raw=true)

Screenshots of ClassicWB FULL from http://classicwb.abime.net/classicweb/full.htm.

![ClassicWB FULL 1](screenshots/classicwb_full1.png?raw=true)

![ClassicWB FULL 2](screenshots/classicwb_full2.png?raw=true)

![ClassicWB FULL 3](screenshots/classicwb_full3.png?raw=true)

![ClassicWB FULL 4](screenshots/classicwb_full4.png?raw=true)

![ClassicWB FULL 5](screenshots/classicwb_full5.png?raw=true)

![ClassicWB FULL 6](screenshots/classicwb_full6.png?raw=true)

![ClassicWB FULL 7](screenshots/classicwb_full7.png?raw=true)

![ClassicWB FULL 8](screenshots/classicwb_full8.png?raw=true)
