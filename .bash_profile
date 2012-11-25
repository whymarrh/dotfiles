function gb { # git branch
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' | sed 's/^/ * /'
}

# a beautiful prompt
# PS1='\e[0;36m\W$(gb) %\e[0m '
PS1='\[\033[0;36m\]\W $\[\033[0m\] '

# fix PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/.bin

# git autocompletion
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
export HISTCONTROL=ignoredups

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

# disable line wrapping
alias less='less -S'

# preferred ls formats
alias l='ls -AOl'
alias ld='ls -AOl | egrep "^d"'
alias ll='ls -Ol'
alias la='ls -AOl'
alias al='ls -AOl'
alias lah='ls -AOlh'
# only dirs
alias lad='ls -AOl | egrep "^d"'
# only links
alias lal='ls -AOl | egrep "^l"'
# only files
alias laf='ls -AOl | egrep -v "^d"'

# free disk space and disk usage
alias du='du -h'
alias df='df -h'

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
alias chocolat='open -a "Chocolat"' # http://chocolatapp.com/
alias mou='open -a "Mou"' # http://mouapp.com/
alias smultron='open -a "Smultron 4"' # http://www.peterborgapps.com/smultron/

# 32-bit Python
alias py='arch -i386 python2.7'
alias python='arch -i386 python2.7'
# because I cannot spell
alias pyhton='arch -i386 python2.7'

# from XKCD comic #530
alias volmid='osascript -e "set volume 3"'
alias stfu='osascript -e "set volume output muted true"'

alias show='cat -n'
alias untar='tar -xf'

# common websites
alias google='open https://google.com'
alias github='open https://github.com'

# 32-bit Java
alias java32='java -d32'
# compiler options
alias javac='javac -g -Xlint:all'

# PHP information
alias phpinfo='php -i'
# always run PHP interactively, use the shebang otherwise
alias php='php -a'
