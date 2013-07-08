export PATH=/usr/local/bin:/usr/bin:~/.cabal/bin/:~/bin/:/usr/texbin/:$(npm bin -g 2>/dev/null):$PATH
export EDITOR=vim
export NODE_PATH=/usr/local/lib/node_modules:$(npm prefix -g 2>/dev/null):$PATH
export LANG=ja_JP.UTF-8

## gisty
export GISTY_DIR="$HOME/src/gists"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source ~/perl5/perlbrew/etc/bashrc
