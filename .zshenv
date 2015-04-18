export GOPATH=$HOME/.go
export PATH=/usr/local/bin:/usr/bin:~/.cabal/bin/:~/bin/:/usr/texbin/:$(npm bin -g 2>/dev/null):/usr/local/opt/mysql55/bin:$GOPATH/bin:$PATH
export EDITOR=vim
export NODE_PATH=/usr/local/lib/node_modules:/Users/zat/.nvm/v0.11.8/lib/node_modules:$(npm prefix -g 2>/dev/null):$PATH
export LANG=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=

## gisty
export GISTY_DIR="$HOME/src/gists"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval "$(plenv init -)"
