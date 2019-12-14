# Diablo 2: Median xl sigma loader

- Allows you to use [D2Stats.exe](https://github.com/Kyromyr/D2Stats) under linux.
- Solves "Failed too many times in a row. Check log for details. Closing D2Stats..." error.
- Should also help mac and windows users.

Usage:
1. Download [sigma-loader.exe](https://github.com/SyndromeDayna/diablo-2-median-xl-sigma-loader/releases/latest/download/sigma-loader.exe)
2. Move it to game directory
3. Launch

Dependencies:
 - Latest development or staging wine. Stable wine is not supported.
 - [Microsoft Visual C++ Redistributable 2015 x32](https://github.com/Kyromyr/D2Stats/releases/latest/download/vc_redist.x86.exe) (for D2Stats)

Known issues:
1. Game does not start due to access violation c0000005
	- Launch D2VidTst.exe and select Glide renderer.
2. Cannot create singleplayer character due to "generic bad character file"
	- Create "~/.wine/drive_c/users/YOUR_USERNAME_HERE/Application Data/MedianXL/save/" directory.
3. [Microsoft C++ Redistributable installer](https://github.com/Kyromyr/D2Stats/releases/latest/download/vc_redist.x86.exe) does not work
	- use this command: `winetricks vcrun2015`
	
Recommended settings:
1. Set wine version to windows 10. Otherwise the game may freeze.
2. After executing `winetricks vcrun2015` command wine version may be set to windows xp. Set it back to windows 10.
3. Launch glide-init.exe in the game directory and set Texture Memory to 108 Mb (Max). Otherwise the game may freeze.


Source code is inside [median_xl_sigma_loader.lpr](median_xl_sigma_loader.lpr) file.
You can compile it using [Lazarus IDE](https://lazarus-ide.org).
