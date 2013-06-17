###############
###############
##           ##
##  Sources  ##
##           ##
###############
###############


source "$HOME/.colors.bash-it.bash" # functions for colours
source "$HOME/.git-prompt.sh" # beautiful Git prompt integration
source "$HOME/.git-completion.bash" # Git autocompletion


##############
##############
##          ##
##  Prompt  ##
##          ##
##############
##############


CURRENT_DIR='\W'
GIT_PS1='$(__git_ps1 "(%s) ")'
SNOWMAN=$'\u2603'
TIME='$(date "+%T")'
PS1_SYMBOL='$'
PS1="${cyan}$CURRENT_DIR $GIT_PS1$PS1_SYMBOL ${reset_color}"


#################
#################
##             ##
##  Variables  ##
##             ##
#################
#################


###########
# Android #
###########


ANDROID_SDK="$HOME/Documents/Projects/SDKs/android" # Android SDK location


################
# Bash History #
################


export HISTFILESIZE=134217728
export HISTIGNORE="&:[ ]*" # ignore successive duplicates and commands prefixed with a space
export HISTSIZE=134217728


#######
# Git #
#######


GIT_PS1_SHOWCOLORHINTS="a nonempty value"
GIT_PS1_SHOWDIRTYSTATE="a nonempty value"
GIT_PS1_SHOWSTASHSTATE="a nonempty value"
GIT_PS1_SHOWUNTRACKEDFILES="a nonempty value"
GIT_PS1_SHOWUPSTREAM="auto"


############
# Gnu Grep #
############


# (below) beautiful grep color matching
export GREP_COLOR='0;31'
export GREP_OPTIONS='--color=auto'


########
# Less #
########


export LESSHISTFILE=- # history file


########
# MAMP #
########


MAMP_DIR='/Applications/MAMP' # MAMP install location


#################
# OS X Specific #
#################


export LC_ALL='en_CA.UTF-8' # prefer UTF-8 Canadian english


#######
# PHP #
#######


PHP5_BIN="$MAMP_DIR/bin/php/php5.4.10/bin" # PHP 5.4.10


##################
# Various Others #
##################


export APPLE=$'\uf8ff'
export COMMAND_KEY=$'\u2318'
export THE_ABYSS='/dev/null'


#####################
#####################
##                 ##
##  Shell Options  ##
##                 ##
#####################
#####################


shopt -s globstar # enable recursive wildcards in Bash 4
shopt -s histappend


############
############
##        ##
##  PATH  ##
##        ##
############
############


# (below) prefer /usr/local/bin to /usr/bin
NEW_PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'
NEW_PATH=$NEW_PATH:"$HOME/.bin"
NEW_PATH=$NEW_PATH:"$ANDROID_SDK/tools"
NEW_PATH=$NEW_PATH:"$ANDROID_SDK/platform-tools"
NEW_PATH='/usr/local/git/bin':$NEW_PATH # newer version of Git
NEW_PATH=$PHP5_BIN:$NEW_PATH # newer version of PHP
export PATH=$NEW_PATH


#######################
#######################
##                   ##
##  Autocompletions  ##
##                   ##
#######################
#######################


[[ -e "$HOME/.bin/github" ]] && complete -W "open status" github # custom GitHub command

# (below) poor man's MANPAGE tabcompletion
PY_SCRIPT="import os; l = []; [l.extend(os.listdir(d)) for d in '$PATH'.replace('~', '$HOME').split(':')]; print(' '.join(l))"
PY_CMD="python -c '$PY_SCRIPT'"
complete -W $PY_CMD man

# (below) tabcomplete `scp`, `ssh`, and `sftp`
# http://git.io/A20AvQ
SSH_CONFIG="$(grep "^Host" $HOME/.ssh/config | grep -v "[?*]" | cut -d " " -f2)"
[[ -e "$HOME/.ssh/config" ]] && complete -o "default" -W "$SSH_CONFIG" scp sftp ssh


###############
###############
##           ##
##  Aliases  ##
##           ##
###############
###############


###############
# Apps (OS X) #
###############


alias chocolat='open -a "Chocolat"' # http://chocolatapp.com/
alias mou='open -a "Mou"' # http://mouapp.com/
alias sublime='open -a "Sublime Text 2"' # http://www.sublimetext.com/2


########
# Java #
########


alias java32='java -d32' # 32-bit Java - runs in a 32-bit env if available
# (below) generates all debugging information, including local variables
alias javac='javac -g:lines,source,vars -Xlint:all' # Java compiler options


#################
# OS X Specific #
#################


alias hide='chflags hidden' # hide things in Mac OS X Finder
alias stfu='osascript -e "set volume output muted true"' # from XKCD comic #530
alias unhide='chflags nohidden' # unhide things in Mac OS X Finder
alias volmid='osascript -e "set volume 3"' # from XKCD comic #530


#######
# PHP #
#######


alias phpinfo='php --info'


##########
# Python #
##########


alias c='pygmentize -O style=monokai -f console256 -g' # coloured output
alias py='python2.7'
alias pyhton='python2.7' # because I can't spell
alias python='python2.7'
alias server="python2.7 -m SimpleHTTPServer 8000 &> $THE_ABYSS" # simple web server
alias ydl='youtube-dl --continue --output "%(title)s.%(ext)s"' # YouTube video downloader


########
# Ruby #
########


alias rb="ruby"


########
# *nix #
########


# (below) preferred ls formats
alias al='ls -AOl'
alias la='ls -AOl'
alias ld='ls -AOl | grep --extended-regexp "^d"'
alias ll='ls -Ol'

alias lad='ls -AOl | grep --extended-regexp "^d"' # list only dirs
alias laf='ls -AOl | grep --extended-regexp --invert-match "^d"' # list only files
alias lal='ls -AOl | grep --extended-regexp "^l"' # list only symlinks

alias dc='cd' # who really uses dc anyway?
alias df='df -h' # free disk space in human-readable format
alias du='du -h' # disk usage in human-readable format
alias ff="cd - &> $THE_ABYSS" # flip flop between two dirs
alias ip='dig +short myip.opendns.com @resolver1.opendns.com' # show my IP address
alias less='less --chop-long-lines' # disable line wrapping
alias lo='logout' # logout with two chars
alias please='sudo' # I can be nice sometimes too
alias sha1='openssl dgst -sha1' # SHA-1 checksum
alias show='cat -n' # show with line numbers
alias todayis='date "+%A, %B %d, %Y"' # today's date
alias untar='tar --extract --file' # extract TAR files
alias ~="cd $HOME" # go home ~ you're drunk (get it? because ~ is home...)


############
# Websites #
############


alias github='open https://github.com'
alias google='open https://www.google.ca'
alias wikipedia='open https://en.wikipedia.org'
