# a beautiful prompt
PS1='\[\033[0;36m\]\W $\[\033[0m\] '

# less history file
export LESSHISTFILE=-

# fix all the paths
NEW_PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'
NEW_PATH=$NEW_PATH:'~/.bin'
# add the Android SDK
NEW_PATH=$NEW_PATH:'~/Documents/Projects/SDKs/android/tools'
NEW_PATH=$NEW_PATH:'~/Documents/Projects/SDKs/android/platform-tools'
# add Node.js
NEW_PATH=$NEW_PATH:'~/.bin/nodejs/bin'
# a newer version of Git
NEW_PATH='/usr/local/git/bin':$NEW_PATH
# replace BSD grep with GNU grep
NEW_PATH='~/.bin/gnu-grep/bin':$NEW_PATH
# add XZ utils
NEW_PATH=$NEW_PATH:'~/.bin/xzutils/bin'
# add Python 3
NEW_PATH=$NEW_PATH:'~/.bin/python/bin'
# add GNU autoconf
NEW_PATH=$NEW_PATH:'~/.bin/autoconf/bin'
# add GNU libtool
NEW_PATH=$NEW_PATH:'~/.bin/libtool/bin'
# add GNU automake
NEW_PATH=$NEW_PATH:'~/.bin/automake/bin'
# export the changes
export PATH=$NEW_PATH

# add some more manuals
MORE_PAGES='/Users/whymarrh/.bin/man'
MORE_PAGES=$MORE_PAGES:'/Users/whymarrh/.bin/autoconf/share/man'
MORE_PAGES=$MORE_PAGES:'/Users/whymarrh/.bin/automake/share/man'
MORE_PAGES=$MORE_PAGES:'/Users/whymarrh/.bin/gnu-grep/share/man'
MORE_PAGES=$MORE_PAGES:'/Users/whymarrh/.bin/libtool/share/man'
MORE_PAGES=$MORE_PAGES:'/Users/whymarrh/.bin/nodejs/lib/node_modules/npm/man'
MORE_PAGES=$MORE_PAGES:'/Users/whymarrh/.bin/nodejs/share/man'
MORE_PAGES=$MORE_PAGES:'/Users/whymarrh/.bin/python/share/man'
MORE_PAGES=$MORE_PAGES:'/Users/whymarrh/.bin/xzutils/share/man'
# export the changes
export MANPATH=:$MORE_PAGES

# Git autocompletion
if [ -r ".git-completion.bash" ]; then
	source .git-completion.bash
fi

# autocomplete custom GitHub command
if [ -e "$HOME/.bin/github" ]; then
	complete -W "open status" github
fi

# autocomplete man pages
complete -W "$(python -c 'import os, sys; l = []; [l.extend(os.listdir(d)) for d in sys.argv[2].replace("~", sys.argv[1]).split(":")]; print(" ".join(l))' $HOME $PATH)" man

# autocomplete `scp`, `ssh`, and `sftp`
if [ -e "$HOME/.ssh/config" ]; then
	complete -o "default" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh
fi

# prefer UTF-8 Canadian english
export LC_ALL='en_CA.UTF-8'

# the history things
export HISTSIZE=134217728
export HISTFILESIZE=134217728
shopt -s histappend

# ignore successive duplicate entries in bash history
# and all commands that are prefixed with a space
export HISTIGNORE="&:[ ]*"

# beautiful grep color matching
export GREP_COLOR='0;31'
export GREP_OPTIONS='--color=auto'

# set the default editor to vim
export EDITOR=vim

# today's date
alias todayis='date "+%A, %B %d, %Y"'

# go home ~ your drunk
alias ~='cd ~'

# show my IP address
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'

# SHA-1 checksum
alias sha1='shasum --algorithm 1'

# I can be nice sometimes too
alias please='sudo'

# useful aliases
alias n='nano'
alias v='vim'
alias edit='vim'

# disable line wrapping
alias less='less --chop-long-lines'

# JavaScript
alias js='/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc'

# preferred ls formats
alias l='ls -AOl'
alias ld='ls -AOl | grep --extended-regexp "^d"'
alias ll='ls -Ol'
alias la='ls -AOl'
alias al='ls -AOl'
alias lah='ls -AOlh'
# only dirs
alias lad='ls -AOl | grep --extended-regexp "^d"'
# only files
alias laf='ls -AOl | grep --extended-regexp --invert-match "^d"'

# free disk space and disk usage
# in human-readable formats
alias df='df -h'
alias du='du -h'

# who really uses dc?
alias dc='cd'

# hide things in Mac OS X Finder
alias hide='chflags hidden'
alias unhide='chflags nohidden'

# up the directory tree
alias up='cd ..'

# logout with two chars
alias lo='logout'

# flip flop between two dirs
alias ff='cd - > /dev/null'

# common apps
alias sublime='open -a "Sublime Text 2"' # http://www.sublimetext.com/2
alias chocolat='open -a "Chocolat"' # http://chocolatapp.com/
alias mou='open -a "Mou"' # http://mouapp.com/

# youtube-dl
alias ydl='youtube-dl --continue --output "%(title)s.%(ext)s"'

# list of connected Android devices
alias devices="adb devices | grep --invert-match '^$'"

# Ruby
alias rb="ruby"

# Python 3
alias py='python3.3'
alias python='python3.3'
# because I cannot spell
alias pyhton='python3.3'

# simple web server
alias server='python2.7 -m SimpleHTTPServer 8000 &> /dev/null'

# from XKCD comic #530
alias volmid='osascript -e "set volume 3"'
alias stfu='osascript -e "set volume output muted true"'

# show with line numbers
alias show='cat -n'
# coloured output
alias c='pygmentize -O style=monokai -f console256 -g'
# decompress tar files
# gunzip is used before this command if the file is gzipped
alias untar='tar --extract --file'

# common websites
alias wikipedia='open https://en.wikipedia.org'
alias google='open https://google.com'

# 32-bit Java
# run in a 32-bit environment if available
alias java32='java -d32'
# Java compiler options
# generates all debugging information, including local variables
alias javac='javac -g:lines,source,vars -Xlint:all'

# PHP information
alias phpinfo='php --info'
# always run PHP interactively, use the shebang otherwise
alias php='php --interactive'
