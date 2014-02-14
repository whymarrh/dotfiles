# If not running interactively, don't do anything
[[ -z "$PS1" ]] && return


###############
###############
##           ##
##  Sources  ##
##           ##
###############
###############


# Beautiful Bash Git prompt
[[ -f "$HOME/.git-prompt.sh" ]] && source "$HOME/.git-prompt.sh"
# Bash Git autocompletion
[[ -f "$HOME/.git-completion.bash" ]] && source "$HOME/.git-completion.bash"


##############
##############
##          ##
##  Prompt  ##
##          ##
##############
##############


CURRENT_DIR='\W'
GIT_PS1='$(__git_ps1 "(%s) ")'
TIME='$(date "+%T")'
PS1_SYMBOL='$'
CYAN='\[\033[0;36m\]'
COLOUR_RESET='\[\033[0m\]'
PS1="${TIME} ${CYAN}${CURRENT_DIR} ${GIT_PS1}${PS1_SYMBOL} ${COLOUR_RESET}"


#################
#################
##             ##
##  Variables  ##
##             ##
#################
#################


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


# Beautiful grep color matches
export GREP_COLOR='0;31'
export GREP_OPTIONS='--color=auto'


########
# Less #
########


export LESSHISTFILE=- # Don't use a history file


#################
# OS X Specific #
#################


export LC_ALL='en_CA.UTF-8'


#######
# PHP #
#######


PHP5="/usr/local/php5/bin" # PHP 5 binaries


##################
# Various Others #
##################


export SNOWMAN=$'\u2603'
export APPLE=$'\uf8ff'
export COMMAND_KEY=$'\u2318'
export THE_ABYSS='/dev/null'


################
# Bash History #
################


export HISTFILE=$THE_ABYSS
export HISTCONTROL=ignoreboth


#####################
#####################
##                 ##
##  Shell Options  ##
##                 ##
#####################
#####################


shopt -s globstar # Enable recursive wildcards in Bash 4


############
############
##        ##
##  PATH  ##
##        ##
############
############


# Prefer /usr/local/bin to /usr/bin
PATH="/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
directories=(
	"$HOME/.bin"
	"$HOME/.bin/boris/bin"
	"$HOME/.bin/casperjs/bin"
	"$HOME/.bin/nodejs/bin"
	"$HOME/.bin/pypy/bin"
	"$HOME/.bin/webp/bin"
	"$HOME/.gem/ruby/2.0.0/bin"
	$PHP5
)
for i in ${directories[@]}
do
	[[ -d "$i" ]] && PATH=$PATH:"$i"
done

#######################
#######################
##                   ##
##  Autocompletions  ##
##                   ##
#######################
#######################


# Tabcomplete `scp`, `ssh`, and `sftp`
# http://git.io/A20AvQ
if [[ -f "$HOME/.ssh/config" ]]
then
	SSH_CONFIG="$(grep "^Host" $HOME/.ssh/config | grep -v "[?*]" | cut -d " " -f2)"
	complete -o "default" -W "$SSH_CONFIG" scp sftp ssh
fi


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


# http://chocolatapp.com/
[[ -d "/Applications/Chocolat.app" ]] && alias chocolat='open -a "Chocolat"'
# http://mouapp.com/
[[ -d "/Applications/Mou.app" ]] && alias mou='open -a "Mou"'
# http://www.sublimetext.com/
[[ -d "/Applications/Sublime Text.app" ]] && alias sublime='open -a "Sublime Text"'


########
# Java #
########


alias java32='java -d32' # 32-bit Java - runs in a 32-bit env if available
# Generates all debugging information, including local variables
alias javac='javac -g:lines,source,vars -Xlint:all' # Java compiler options


##############
# JavaScript #
##############


alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc'


#################
# OS X Specific #
#################


if [[ $(uname) == "Darwin" ]]
then
	alias hide='chflags hidden' # Hide things in Mac OS X Finder
	alias md5sum='md5'
	alias mute='osascript -e "set volume output muted true"' # XKCD comic #530
	alias plistbuddy='/usr/libexec/PlistBuddy'
	alias unhide='chflags nohidden' # Unhide things in Mac OS X Finder
	alias volmid='osascript -e "set volume 3"' # XKCD comic #530
fi


#######
# PHP #
#######


alias phpinfo='php --info'


##########
# Python #
##########


alias py='python2.7'
alias pyhton='python2.7' # Because I can't spell
alias python='python2.7'
alias server="python2.7 -m SimpleHTTPServer 8000 &> $THE_ABYSS; echo"
alias ydl='youtube-dl --continue --output "%(title)s.%(ext)s"' # YouTube video downloader


########
# Ruby #
########


alias rb="ruby"


########
# *nix #
########


alias sudo='sudo '

# Preferred ls formats
alias al='ls -AOl'
alias la='ls -AOl'
alias ld='ls -AOl | grep --extended-regexp "^d"'
alias ll='ls -Ol'

alias lad='ls -AOl | grep --extended-regexp "^d"' # List only directories
alias laf='ls -AOl | grep --extended-regexp --invert-match "^d"' # List only files
alias lal='ls -AOl | grep --extended-regexp "^l"' # List only symlinks

alias dc='cd' # Who really uses dc anyway?
alias df='df -h' # Free disk space in human-readable format
alias du='du -h' # Disk usage in human-readable format
alias ff="cd - &> $THE_ABYSS" # Flip-flop between two directories
alias filesize='stat -f "%z bytes"' # Display filesizes
alias hosts='sudo vim /etc/hosts' # Edit the hosts file
alias vhosts="sudo vim /etc/apache2/extra/httpd-vhosts.conf" # Edit Apache vhosts
alias ip='dig +short myip.opendns.com @resolver1.opendns.com' # Print my IP address
alias less='less --chop-long-lines' # Disable line wrapping
alias lo='logout' # Logout with two chars
alias please='sudo' # I can be nice sometimes too
alias sha1='openssl dgst -sha1' # SHA-1 checksum
alias show='cat -n' # Show with line numbers
alias todayis='date "+%A, %B %d, %Y"' # Today's date
alias untar='tar --extract --file' # Extract TAR files
alias ~="cd $HOME" # Go home ~ you're drunk (get it? because ~ is home...)


############
# Websites #
############


alias github='open https://github.com'
alias google='open https://www.google.ca'
alias wikipedia='open https://en.wikipedia.org'


#################
#################
##             ##
##  Functions  ##
##             ##
#################
#################


playground() {
	local dir="/private/tmp/Playground"
	test -d $dir || mkdir $dir
	cd $dir
	clear
	# osascript -e 'if application "Terminal" is frontmost then tell application "System Events" to keystroke "k" using command down'
}
