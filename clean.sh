#!/bin/bash
# Author: Tiffany Feng (github.com/changanmoon)

# Grant sudo
sudo -S id -u
echo "" | awk '{fflush()}'

# Define a universal function to delete file/folder under sudo privileges
function safe_delete() {
    # use "test -e" command to check if a file/folder exists
    sudo test -e "$1" && sudo rm -rf "$1"
}

# Delete application supoort
safe_delete /Library/PrivilegedHelperTools/com.microsoft.autoupdate.helper
safe_delete /Library/Application\ Support/Microsoft/MAU2.0
safe_delete ~/Library/Application\ Support/Microsoft\ AutoUpdate

# Delete preferences
safe_delete /Library/Preferences/com.microsoft.autoupdate2.plist
safe_delete ~/Library/Preferences/com.microsoft.autoupdate2.plist
safe_delete ~/Library/Preferences/com.microsoft.autoupdate.fba.plist

# Delete containers
safe_delete ~/Library/Group\ Containers/UBF8T346G9.ms
safe_delete ~/Library/Group\ Containers/UBF8T346G9.office

# Delete cache and log files
safe_delete /private/var/db/receipts/com.microsoft.package.Microsoft_AutoUpdate.app.bom
safe_delete /private/var/db/receipts/com.microsoft.package.Microsoft_AutoUpdate.app.plist
safe_delete /Library/Logs/Microsoft
safe_delete ~/Library/Caches/com.microsoft.autoupdate.fba
safe_delete ~/Library/Caches/com.microsoft.autoupdate2
safe_delete ~/Library/HTTPStorages/com.microsoft.autoupdate2

# Delete startup items
safe_delete /Library/LaunchDaemons/com.microsoft.autoupdate.helper.plist
safe_delete /Library/LaunchAgents/com.microsoft.update.agent.plist

# Ending
sudo killall Finder; killall Dock
exit
