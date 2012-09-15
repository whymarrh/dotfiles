PS1='\e[0;36m\W %\e[0m '

# add ~/.bin to PATH
export PATH="$HOME/.bin:$PATH"

# git autocompletion
source ~/.git-completion.bash

# ignore successive duplicate entries in bash history
export HISTCONTROL=ignoredups

# beautiful grep color matching
export GREP_COLOR='0;31'
export GREP_OPTIONS='--color=auto'

# set the default editor to nano
export EDITOR=nano

# fix bash history problems
shopt -s histappend
export PROMPT_COMMAND='history -a; history -n'

# source bash aliases
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi
