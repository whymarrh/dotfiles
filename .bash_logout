case `uname` in
	Darwin)
		# Clear OS X quarantined file list
		echo 'delete from LSQuarantineEvent;' | sqlite3 $HOME/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV2
	;;
	Linux)
		# Fix OS X terminal title
		printf '\e]0;\a'
	;;
esac

type adb >/dev/null 2>&1 && adb "kill-server"
rm -fr $HOME/.{boris,php,irb,mysql,sqlite}_history $HOME/.node-gyp
