#!/bin/bash
# Copyright 2022-2024 Tiffany Fung

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Grant sudo
sudo -S id -u
echo "" | awk '{fflush()}'

# Define a universal function to remove file/folder under sudo privileges
function delete() {
    # use "test -e" command to check if a file/folder exists
    sudo test -e "$1" && sudo rm -rf "$1"
}

# Remove application support folders
delete /Library/PrivilegedHelperTools/com.microsoft.autoupdate.helper
delete /Library/Application\ Support/Microsoft/MAU2.0
delete ~/Library/Application\ Support/Microsoft\ AutoUpdate

# Remove preferences
delete /Library/Preferences/com.microsoft.autoupdate2.plist
delete ~/Library/Preferences/com.microsoft.autoupdate2.plist
delete ~/Library/Preferences/com.microsoft.autoupdate.fba.plist

# Remove containers
delete ~/Library/Group\ Containers/UBF8T346G9.ms/com.microsoft.autoupdate2
delete ~/Library/Group\ Containers/UBF8T346G9.ms/MerpTempItems
delete ~/Library/Group\ Containers/UBF8T346G9.ms/Microsoft AutoUpdate.MERP.params.txt
delete ~/Library/Group\ Containers/UBF8T346G9.office

# Remove cache and log files
delete /private/var/db/receipts/com.microsoft.package.Microsoft_AutoUpdate.app.bom
delete /private/var/db/receipts/com.microsoft.package.Microsoft_AutoUpdate.app.plist
delete ~/Library/Caches/com.microsoft.autoupdate2
delete ~/Library/Caches/com.microsoft.autoupdate.fba
delete ~/Library/Caches/Microsoft/uls/com.microsoft.autoupdate2
delete ~/Library/HTTPStorages/com.microsoft.autoupdate2
delete /Library/Logs/Microsoft

# Remove startup items
delete /Library/LaunchDaemons/com.microsoft.autoupdate.helper.plist
delete /Library/LaunchAgents/com.microsoft.update.agent.plist

# Remove Microsoft Office Licensing helper
delete /Library/LaunchDaemons/com.microsoft.office.licensingV2.helper.plist

# Remove OneDrive SyncReporter
delete /Library/LaunchAgents/com.microsoft.SyncReporter.plist

# Remove OneDrive StandaloneUpdater and its daemon
delete /Library/LaunchAgents/com.microsoft.OneDriveStandaloneUpdater.plist
delete /Library/LaunchDaemons/com.microsoft.OneDriveStandaloneUpdaterDaemon.plist
delete /Library/LaunchDaemons/com.microsoft.OneDriveUpdaterDaemon.plist

# Ending (Cleanup and restart Finder & Dock)
sudo pkgutil --forget com.microsoft.package.Microsoft_AutoUpdate.app
sudo pkgutil --forget com.changanmoon.pkg.UninstallMicrosoftAutoUpdate
sudo killall Finder; killall Dock
exit
