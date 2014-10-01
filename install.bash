#!/usr/bin/env bash

rm -f .git-completion.bash
rm -f .git-prompt.sh

curl -sO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -sO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

mv git-prompt.sh .git-prompt.sh
mv git-completion.bash .git-completion.bash

find . -name ".*" -not -name "." -not -name ".git" -not -name ".sublime" -not -name ".osx" -exec cp -r '{}' "$HOME/" \;
