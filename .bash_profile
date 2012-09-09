PS1='\e[0;36m\W %\e[0m '

# add ~/.bin to PATH
export PATH="$HOME/.bin:$PATH"

# git autocompletion
source ~/.git-completion.bash

# ignore successive duplicate entries in bash history
export HISTCONTROL=ignoredups

# beautiful grep color matching
export GREP_OPTIONS='--color=auto'

# set the default editor to nano
export EDITOR=nano

# append command history immediately
PROMPT_COMMAND='history -a'

# source bash aliases
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi
