# functions for colours
source .colors.bash-it.bash
# a beautiful prompt
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE="a nonempty value"
# GIT_PS1_SHOWSTASHSTATE="a nonempty value"
# GIT_PS1_SHOWUNTRACKEDFILES="a nonempty value"
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="a nonempty value"
SNOWMAN=$'\u2603 ' # Bash 4.2+
TIME='$(date "+%T")'
GIT_PS1='$(__git_ps1 "git:(%s) ")'
CURRENT_DIR='\W'
PS1_SYMBOL='$'
PS1="${cyan}$CURRENT_DIR $GIT_PS1$PS1_SYMBOL ${reset_color}"

# less history file
export LESSHISTFILE=-

# fix the path
# prefer /usr/local/bin to /usr/bin
NEW_PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'
NEW_PATH=$NEW_PATH:"$HOME/.bin"
# add the Android SDK
NEW_PATH=$NEW_PATH:"$HOME/Documents/Projects/SDKs/android/tools"
NEW_PATH=$NEW_PATH:"$HOME/Documents/Projects/SDKs/android/platform-tools"
# a newer version of Git
NEW_PATH='/usr/local/git/bin':$NEW_PATH
# export the changes
export PATH=$NEW_PATH

# add some more man pages
# MORE_PAGES=''
# export the changes
# export MANPATH=:$MORE_PAGES

# Git autocompletion
if [ -r ".git-completion.bash" ]; then
	source .git-completion.bash
fi

# autocomplete custom GitHub command
if [ -e "$HOME/.bin/github" ]; then
	complete -W "open status" github
fi

# tabcomplete man pages
PY_SCRIPT="import os; l = []; [l.extend(os.listdir(d)) for d in '$PATH'.replace('~', '$HOME').split(':')]; print(' '.join(l))"
PY_CMD="python -c '$PY_SCRIPT'"
complete -W $PY_CMD man

# tabcomplete `scp`, `ssh`, and `sftp`
# http://git.io/A20AvQ
if [ -e "$HOME/.ssh/config" ]; then
	complete -o "default" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh
fi

# prefer UTF-8 Canadian english
export LC_ALL='en_CA.UTF-8'

# enable recursive wildcards in Bash 4
shopt -s globstar
# add dotfiles to globs
# shopt -s dotglob

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

# coloured ls
export LSCOLORS='Gxfxcxdxdxegedabagacad'

# set the default editor to vim
export EDITOR=vim

# today's date
alias todayis='date "+%A, %B %d, %Y"'

# go home ~ your drunk
alias ~='cd ~'

# show my IP address
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'

# SHA-1 checksum
alias sha1='openssl dgst -sha1'

# clear
alias cls='clear'

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
# only symlinks
alias lal='ls -AOl | grep --extended-regexp "^l"'
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

# Youtube downloader
alias ydl='youtube-dl --continue --output "%(title)s.%(ext)s"'

# list of connected Android devices
alias devices="adb devices | grep --invert-match '^$'"

# Ruby
alias rb="ruby"

# Python 2.7
alias py='python2.7'
alias python='python2.7'
# because I cannot spell
alias pyhton='python2.7'

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
