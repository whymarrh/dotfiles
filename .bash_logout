case $(uname) in
	Darwin)
		# Clear OS X quarantined file list
		echo 'delete from LSQuarantineEvent;' | sqlite3 "$HOME/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV2"
	;;
	Linux)
		# Fix OS X terminal title
		printf '\e]0;\a'
	;;
esac

command -v adb &> /dev/null && adb "kill-server"
rm -fr "$HOME"/.{boris,php,irb,mysql,sqlite}_history "$HOME"/.{cache,composer,local,node-gyp,npm,rnd}
