<img width="1200" height="400" alt="cover" src="https://github.com/user-attachments/assets/e168ac83-daa4-4347-b791-0c2dceed1dc2" />

# DCS: JAS-39C by Whisky Actual
The "JF-39" is a fork of the JAS-39 Community mod that utilizes the JF-17 avionics. <ins>**You must own the**</ins> <a href="https://www.digitalcombatsimulator.com/en/shop/modules/thunder/"> **DCS: JF-17</a> <ins> to fly this mod**</ins>. However, you can install the AI component to replace the JF-17 with the JAS-39 model and armaments.

## Contributors (alphabetical order)
Breadmaker91, Currenthill, FatSpacePanda, Turbotomten, Yatsie

## Download
Download the latest release at https://github.com/whisky-actual/JAS-39-C-by-Whisky-Acutal/releases. <ins>**Make sure to select the ZIPED assets to avoid file corruption in your downloads.**</ins> 

## Table of Contents

- [How to](#how-to)
  - [Install](#install)
  - [Installation Troubleshooting](#installation-troubleshooting)
  - [Toggle](#toggle)
  - [OVGME](#ovgme)
  - [Uninstall](#uninstall)

- [Additional Configurations](#additional-configurations)
  - [Weapons Configuration](#weapons-configuration)
  - [Option Menu](#option-menu)
  - [TGP Pylon](#tgp-pylon)
  - [SATNAV](#SATNAV)

- [Known Bugs](#known-bugs)
- [Frequently Asked Questions](#frequently-asked-questions)

## How to
Since this mod needs to be installed in your <ins>**main DCS folder (not the saved game)**</ins>, several configurations have been made to accommodate the users.

### Install
You will need to locate your main DCS folder and extract the two main components to it:
  - The JF-39_AI.zip contains the plane and weapons. If you don't own the JF-17, you can still use this as an AI replacement for the JF-17
  - JF-39_Player.zip contains the cockpit, systems, and files needed to fly the JAS-39-C. This will replace the JF-17 cockpit also.
When asked if you want to override the files (they will be one for each zip accept, backups are provided in the installation package.

### Installation Troubleshooting
If your game fails to launch, maybe the mod is conflicting with another one. We suggest removing all of the mods found in **\Users\username\Saved Games\DCS\Mods\**. You can add your mods back one at a time and see which one conflicts.

### Toggle
You will be able to switch between the JF-39 and the JF-17 by changing the value from ***TRUE*** to ***FALSE*** on line 4 of the entry files for each component. By default, the values will be = **TRUE**. You will need to restart the game to apply the changes.
  - The entry file for the JF-39_AI will be located in \DCS World OpenBeta\CoreMods\aircraft\ChinaAssetPack\entry.lua
  - The entry file for the JF-39_Player will be located in \DCS World OpenBeta\Mods\aircraft\JF-17\entry.lua

![entry](https://github.com/user-attachments/assets/3aa11da8-fedc-49b0-b096-44c010343df0)

### OVGME
If you prefer, you can also use OVGME or any other mod management software to manage the mod. 
  1) Download the mod and extract it to your desktop.
  2) Make backups of your CoreMods AND Mods folders in your main DCS install.
  3) Drop the content of the CoreMods AND Mods in your main DCS install; override the files.
  4) To remove the mod, you will need to delete the CoreMods and Mods folders and replace them with your backups.

### Uninstall
If you want to uninstall the mod, you simply need to replace the entry.lua for each component found in the following directory:
  - The entry file for the JF-39_AI will be located in \DCS World OpenBeta\CoreMods\aircraft\ChinaAssetPack\JF-39\Backup\entry.lua
  - The entry file for the JF-39_Player will be located in \DCS World OpenBeta\Mods\aircraft\JF-17\JF-39\Backup\entry.lua
  - Overwrite the files than you will be able to delete the two JF-39 folders, and you will be back to your vanilla installation.
    
## Additional Configurations
Additional configuration items have been added to the mod to enhance the capabilities of the JF39. These are workarounds that allow the user to select specific weapons, to hide the pilot's body or to attach the TGP to the RECCE pylon. 

### Weapons Configuration
You will be able to select different loadouts based on the parameter selected by the user. The file that needs to be edited is located in the \DCS World OpenBeta\CoreMods\aircraft\ChinaAssetPack\JF-39\weapon_config.lua
You will need to change the 'SAAB' to any other option. Look at the tables above to select the loadout that you would like to fly. You will need to restart the game to apply the changes.

![weapon_config](https://github.com/user-attachments/assets/3ac44e83-1874-48f8-850f-45be2633796e)

### Option Menu
In the option menu, you can select to hide the pilot's body by default. (Replaces the hide stick option)

![hidepilot](https://github.com/user-attachments/assets/c4a4f5ae-831d-41d4-8f09-1022424d26b0)

### TGP Pylon
Follow this procedure to be able to load the TGP on the RECCE pylon. Since v.2.9x, the TGP only works in A-G mode (keyboard 7); this is a limitation of the JF-17, not the mod.

<img width="505" height="687" alt="TGP" src="https://github.com/user-attachments/assets/1c792199-5a96-4302-ba85-b20472c02aac" />

### SATNAV
Make sure that the SATNAV option is unrestricted to avoid having issues with weapons that require GPS targeting. This option could also be controlled on the mission or the server, so if your weapons are not hitting their targets, verify this before logging a defect.

![SATNAV](https://github.com/user-attachments/assets/357ae2f4-bcac-4093-8d37-753d438f01bc)

## Known Bugs
Find the full list of bugs and enhancements at https://github.com/whisky-actual/Community-JF-39/issues

## Frequently Asked Questions
- Q: Do you need JF-17 to use the module?
  - Yes.
- Q: Do we plan to make it a standalone?
  - No.
- Q: Will the JF-39 mod pass IC?
  - No.
