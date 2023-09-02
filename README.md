# UninstallMAU
An easy way to uninstall Microsoft AutoUpdate on macOS. Created with [Packages](http://s.sudre.free.fr/Software/Packages/about.html).

# Why does it use .pkg format?
This project only uses a shell script to delete Microsoft AutoUpdate. It **does not** modify other parts of the system.

In case some people have little knowledge of shell script, I packed it in a .pkg package. All you need is to "install" it like other software. 

To find the shell script, see `clean.sh` in the code above. 

# How to use this?
1. Download the **latest** release of UninstallMAU (.pkg format);
2. Double-click it and perform an "install";
3. Done.

# Do I need to quit Microsoft apps before "installation"?
Of course - if any Microsoft app runs in the background, the installer will not let you continue. (This is necessary to avoid conflict)

For example: </br>

<img src="https://raw.githubusercontent.com/changanmoon/UninstallMAU/main/demo.png" alt="Example picture" width="500">
