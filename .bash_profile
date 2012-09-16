# a beautiful prompt
PS1='\e[0;36m\W %\e[0m '

# add ~/.bin/ to PATH
export PATH="$HOME/.bin/:$PATH"

# git autocompletion
source ~/.git-completion.bash

# ignore successive duplicate entries in bash history
export HISTCONTROL=ignoredups

# beautiful grep color matching
export GREP_COLOR='0;31'
export GREP_OPTIONS='--color=auto'

# set the default editor to nano
export EDITOR=nano

# useful aliases
alias n='nano'

# preferred ls formats
alias la='ls -AOl'
alias al='ls -AOl'
alias lah='ls -AOlh'
# only dirs
alias lad='ls -AOl | grep "^d"'
# only files
alias laf='ls -AOl | grep -v "^d"'

# free disk space and disk usage
alias du='du -h'
alias df='df -h'

# who really uses dc?
alias dc='cd'

# hide things in Mac OS X Finder
alias hide='chflags hidden'
alias unhide='chflags nohidden'

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

if [ -f ~/.ssh_aliases ]; then
  # source common ssh aliases
  source ~/.ssh_aliases
fi

# from XKCD comic #530
alias volmid='osascript -e "set volume 3"'
alias stfu='osascript -e "set volume output muted true"'

alias show='cat -n'
alias untar='tar -xf'

# 32-bit Java
alias java32='java -d32'

# PHP information
alias phpinfo='php -i'
# always run PHP interactively, use the shebang otherwise
alias php='php -a'
