# UninstallMAU
An easy way to uninstall Microsoft AutoUpdate on macOS. Created with [Packages](http://s.sudre.free.fr/Software/Packages/about.html).

# Why does it use .pkg format?
This project only uses a shell script to delete Microsoft AutoUpdate. It **does not** modify other parts of the system.

In case some people have little knowledge of shell script, I packed it in a .pkg package. All you need is to "install" it like other software. 

To find the shell script, see `clean.sh` in the code above. 

# How to use this?
1. Download [the **latest** release](https://github.com/changanmoon/UninstallMAU/releases) of UninstallMAU (.pkg format);
2. Double-click it and perform an "install";
3. Done.

# Do I need to quit Microsoft apps before "installation"?
Of course. If any Microsoft app runs in the background, the installer will NOT let you continue. (This is necessary to avoid potential conflict)

For example: </br>

<img src="https://raw.githubusercontent.com/changanmoon/UninstallMAU/main/demo1.png" alt="Example picture" width="500">

# On macOS Sonoma and later...
You may get this prompt: `"Installer.app" would like to access data from other apps.` 

Please click "Allow", otherwise this script won't work!

<img src="https://raw.githubusercontent.com/changanmoon/UninstallMAU/main/demo2.png" alt="Example picture" width="500">
