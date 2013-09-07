# Clear OS X quarantined file list
echo 'delete from LSQuarantineEvent;' | sqlite3 $HOME/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV2

# Kill ADB server
type adb >/dev/null 2>&1 && adb "kill-server"

# Remove temp. history files
rm -f $HOME/.{php,irb,mysql,sqlite}_history
