#!/bin/bash
# Author: Tiffany Feng (github.com/changanmoon)

# Grant sudo
sudo -S id -u
echo "" | awk '{fflush()}'

# Define a universal function to delete file/folder under sudo privileges
function delete() {
    # use "test -e" command to check if a file/folder exists
    sudo test -e "$1" && sudo rm -rf "$1"
}

# Delete application supoort
delete /Library/PrivilegedHelperTools/com.microsoft.autoupdate.helper
delete /Library/Application\ Support/Microsoft/MAU2.0
delete ~/Library/Application\ Support/Microsoft\ AutoUpdate

# Delete preferences
delete /Library/Preferences/com.microsoft.autoupdate2.plist
delete ~/Library/Preferences/com.microsoft.autoupdate2.plist
delete ~/Library/Preferences/com.microsoft.autoupdate.fba.plist

# Delete containers
delete ~/Library/Group\ Containers/UBF8T346G9.ms
delete ~/Library/Group\ Containers/UBF8T346G9.office

# Delete cache and log files
delete /private/var/db/receipts/com.microsoft.package.Microsoft_AutoUpdate.app.bom
delete /private/var/db/receipts/com.microsoft.package.Microsoft_AutoUpdate.app.plist
delete /Library/Logs/Microsoft
delete ~/Library/Caches/com.microsoft.autoupdate.fba
delete ~/Library/Caches/com.microsoft.autoupdate2
delete ~/Library/HTTPStorages/com.microsoft.autoupdate2

# Delete startup items
delete /Library/LaunchDaemons/com.microsoft.autoupdate.helper.plist
delete /Library/LaunchAgents/com.microsoft.update.agent.plist

# Ending
sudo killall Finder; killall Dock
exit
