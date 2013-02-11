# git branch
function gb() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' | sed 's/^/ * /'
}
# mkdir and cd in one
function md() {
	mkdir -p "$@" && cd "$@"
}

# a beautiful prompt
# PS1='\e[0;36m\W$(gb) %\e[0m '
PS1='\[\033[0;36m\]\W %\[\033[0m\] '

# less history file
export LESSHISTFILE=-

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
# a newer version of Git
export PATH=/usr/local/git/bin:$PATH
# GNU grep
export PATH=~/.bin/gnu-grep/bin:$PATH
# XZ utils
export PATH=$PATH:~/.bin/xz/bin
# Python 3
export PATH=$PATH:~/.bin/python/bin

# Git autocompletion
if [ -r ".git-completion.bash" ]; then
	source .git-completion.bash
fi

if [ -e "$HOME/.ssh/config" ]; then
	complete -o "default" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh
fi

# beautiful coloring for man pages
# export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
# export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
# export LESS_TERMCAP_me=$'\E[0m'           # end mode
# export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
# export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
# export LESS_TERMCAP_ue=$'\E[0m'           # end underline
# export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# prefer UTF-8 Canadian english
export LC_ALL='en_CA.UTF-8'

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

# from XKCD comic #530
alias volmid='osascript -e "set volume 3"'
alias stfu='osascript -e "set volume output muted true"'

# show with line numbers
alias show='cat -n'
# coloured output
alias c='pygmentize -O style=monokai -f console256 -g'
# decompress tar files
# gunzip is used before this command if the file is gzipped
alias untar='tar -xf'

# common websites
alias wikipedia='open https://en.wikipedia.org'
alias google='open https://google.com'
alias github='open https://github.com/whymarrh?tab=repositories'

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
