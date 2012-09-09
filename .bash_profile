PS1='\e[0;35m\W %\e[0m '

# git autocompletion
source ~/.git-completion.bash

# ignore successive duplicate entries in bash history
export HISTCONTROL=ignoredups

# beautiful grep color matching
export GREP_OPTIONS='--color=auto'

# append command history immediately
PROMPT_COMMAND='history -a'

# source bash aliases
if [ -f ~/.aliases ]; then
	source ~/.aliases
fi
