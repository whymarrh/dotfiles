# kill android device bridge server
adb "kill-server"
# temp history files
rm -f $HOME/.{php,irb,mysql,sqlite}_history
