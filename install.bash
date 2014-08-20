#!/usr/bin/env bash

curl -sO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -sO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

mv git-completion.bash .git-completion.bash
mv git-prompt.sh .git-prompt.sh

find . -name ".*" -not -name "." -not -name ".git" -exec cp -r '{}' "$HOME/" \;
