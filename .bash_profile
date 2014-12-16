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


COLOUR_RESET='\[\033[0m\]'
CYAN='\[\033[0;36m\]'
GIT_PS1='$(__git_ps1 "(%s) ")'
WHITE_BOLD='\[\033[1;37m\]'
if [[ $(uname) == "Darwin" ]]
then
	PS1="\T ${CYAN}\W ${GIT_PS1}$ ${COLOUR_RESET}"
fi
if [[ $(uname) == "Linux" ]]
then
	PS1="${WHITE_BOLD}@\h${COLOUR_RESET} \W ${GIT_PS1}$ "
fi


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


########
# Grep #
########


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


##################
# Various Others #
##################


export SNOWMAN=$'\u2603'
export APPLE=$'\uf8ff'
export COMMAND_KEY=$'\u2318'
export ABYSS='/dev/null'


################
# Bash History #
################


export HISTFILE=$ABYSS
export HISTCONTROL=ignoreboth



#######################
# Bash Autocompletion #
#######################


FIGNORE="Application Scripts"


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
PATH="/usr/local/php5/bin:/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
directories=(
	"$HOME/.bin"
	"$HOME/.bin/android/platform-tools"
	"$HOME/.bin/android/tools"
	"$HOME/.bin/boris/bin"
	"$HOME/.bin/casperjs/bin"
	"$HOME/.bin/emsdk"
	"$HOME/.bin/gradle/bin"
	"$HOME/.bin/nodejs/bin"
	"$HOME/.bin/pypy/bin"
	"$HOME/.bin/webp/bin"
	"$HOME/.gem/ruby/2.0.0/bin"
)
for i in "${directories[@]}"
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
	SSH_CONFIG="$(grep "^Host" "$HOME/.ssh/config" | grep -v "[?*]" | cut -d " " -f2)"
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


alias java32='java -d32' # Runs in a 32-bit environment if available
# Generates all debugging information, including local variables
alias javac='javac -g:lines,source,vars -Xlint:all' # Java compiler options


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


##########
# Python #
##########


alias py='python2.7'
alias pyhton='python2.7' # Because I can't spell
alias python='python2.7'
alias ydl='youtube-dl --continue --output "%(title)s.%(ext)s"' # YouTube video downloader


########
# *nix #
########


alias sudo='sudo '

alias dc='cd' # Who really uses dc anyway?
alias df='df -h' # Free disk space in human-readable format
alias du='du -h' # Disk usage in human-readable format
alias ff="cd - &> $ABYSS" # Flip-flop between two directories
alias filesize='stat -f "%z bytes"' # Display filesizes

if [[ $(uname) == "Darwin" ]]
then
	alias hosts='sudo vim /etc/hosts' # Edit the hosts file
	alias vhosts="sudo vim /etc/apache2/extra/httpd-vhosts.conf" # Edit Apache vhosts
fi

alias ip='dig +short myip.opendns.com @resolver1.opendns.com' # Print my IP address
alias less='less --chop-long-lines' # Disable line wrapping
alias lo='logout' # Logout with two chars
alias please='sudo ' # I can be nice sometimes too
alias sha1='openssl dgst -sha1' # SHA-1 checksum
alias show='cat -n' # Show with line numbers
alias todayis='date "+%A, %B %d, %Y"' # Today's date
alias untar='tar --extract --file' # Extract TAR files
alias ~="cd $HOME" # Go home ~ you're drunk (get it? because ~ is home...)


#################
#################
##             ##
##  Functions  ##
##             ##
#################
#################


if [[ $(uname) == "Darwin" ]]
then
	# Thankfully OS X's ls respects the LC_COLLATE env var /s
	function la()
	{
		ls -fOl "$@" | grep --extended-regexp --invert-match " [\.]{1,2}$"
	}
else
	function la()
	{
		ls -Alv --color=auto "$@"
	}
fi
function lad()
{
	la "$@" | grep --extended-regexp "^d" # Only show directories
}
function lal()
{
	la "$@" | grep --extended-regexp "^l" # Only show symlinks
}
function laf()
{
	la "$@" | grep --extended-regexp --invert-match "(^d)|(^l)" # Only show files
}

function playground()
{
	local dir="/tmp/Playground"
	[[ -d $dir ]] || mkdir $dir
	cd $dir && clear
}

function json()
{
	python -mjson.tool
}

function server()
{
	local port=${1:-8000}
	echo "Serving HTTP on 0.0.0.0 port $port"
	python -mSimpleHTTPServer "$port" &> "$ABYSS"
	echo
}
