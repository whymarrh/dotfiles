function gb { # git branch
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' | sed 's/^/ * /'
}

# a beautiful prompt
# PS1='\e[0;36m\W$(gb) %\e[0m '
PS1='\[\033[0;36m\]\W %\[\033[0m\] '

# fix PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
# local bin
export PATH=$PATH:~/.bin
# Android SDK tools
export PATH=$PATH:~/Documents/Projects/SDKs/android/tools
# Android SDK platform-tools
export PATH=$PATH:~/Documents/Projects/SDKs/android/platform-tools
# node.js
export PATH=$PATH:~/.bin/node/bin
# LESS and lessc
export PATH=$PATH:~/.bin/less.js/bin
# a newer version of Git
export PATH=/usr/local/git/bin:$PATH
# GNU grep
export PATH=~/.bin/gnu-grep/bin:$PATH
# XZ utils
export PATH=$PATH:~/.bin/xz/bin
# Python 3
export PATH=$PATH:~/.bin/python/bin

# Git autocompletion
source ~/.git-completion.bash

# beautiful coloring for man pages
# export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
# export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
# export LESS_TERMCAP_me=$'\E[0m'           # end mode
# export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
# export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
# export LESS_TERMCAP_ue=$'\E[0m'           # end underline
# export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# the history things
export HISTSIZE=100000000
export HISTFILESIZE=100000000
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
alias today='date "+%A, %B %d, %Y"'

# useful aliases
alias n='nano'
alias v='vim'
alias edit='vim'

# disable line wrapping
alias less='less -S'

# JavaScript
alias js='/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc'

# preferred ls formats
alias l='ls -AOl'
alias ld='ls -AOl | egrep "^d"'
alias ll='ls -Ol'
alias la='ls -AOl'
alias al='ls -AOl'
alias lah='ls -AOlh'
# only dirs
alias lad='ls -AOl | egrep "^d"'
# only files
alias laf='ls -AOl | egrep -v "^d"'

# free disk space and disk usage
alias df='df -h'
alias du='du -h'

# who really uses dc?
alias dc='cd'

# hide things in Mac OS X Finder
alias hide='chflags hidden'
alias unhide='chflags nohidden'

# up the dir tree
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
alias ydl='youtube-dl -c -o "%(title)s.%(ext)s"'

# list of connected Android devices
alias devices="adb devices | grep -v '^$'"

# Ruby
alias rb="ruby"

# Python 3
alias py='python3.3'
alias python='python3.3'
# because I cannot spell
alias pyhton='python3.3'

# from XKCD comic #530
alias volmid='osascript -e "set volume 3"'
alias stfu='osascript -e "set volume output muted true"'

alias show='cat -n'
alias untar='tar -xf'

# common websites
alias google='open https://google.com'
alias github='open https://github.com/whymarrh?tab=repositories'

# 32-bit Java
alias java32='java -d32'
# compiler options
alias javac='javac -g -Xlint:all'

# PHP information
alias phpinfo='php -i'
# always run PHP interactively, use the shebang otherwise
alias php='php -a'
