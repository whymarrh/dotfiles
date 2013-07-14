# clear quarantine list
echo 'delete from LSQuarantineEvent;' | sqlite3 $HOME/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV2

# kill android device bridge server
adb "kill-server"

# temp history files
rm -f $HOME/.{php,irb,mysql,sqlite}_history
