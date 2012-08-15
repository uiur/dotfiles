export PATH=/usr/local/bin:/usr/bin:~/.cabal/bin/:~/bin/:/usr/texbin/:$PATH
export EDITOR=vim
export NODE_PATH=/usr/local/lib/node_modules:$PATH
export LANG=ja_JP.UTF-8

## gisty
export GISTY_DIR="$HOME/src/gists"

autoload colors
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats "[%b]"
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
PROMPT="%{${fg[green]}%}%~%{${reset_color}%}%% "
RPROMPT="%1(v|%F{yellow}%1v%f|)"
#PROMPT2="%{${fg[green]}%}%_%{${reset_color}%}%1(v|%{${vcs_info_msg_0_}%}|)%% "
SPROMPT="%B%{${fg[yellow]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "

case "${TERM}" in
kterm*|xterm*)
  precmd() {
      echo -ne "\033]0;${USER}@${HOST%%.*}\007"
  }
  ;;
esac

export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'


## aliases
#
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias v='vim'
alias gvim='env LANG=ja_JP.UTF-8 open -a /Applications/MacVim.app "$@"'
alias reload='source ~/.zshrc'
alias re='source ~/.zshrc'
alias l='ls -G'
alias ls='ls -G'
alias la='ls -a'
alias ll='ls -l'
alias lal='ls -al'
alias mk='mkdir'
alias p='popd > /dev/null'
alias rmr='rm -rf'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias kmc='ssh uiureo@kmc.gr.jp'

alias memo='vi ~/memo/'
alias gosh='rlwrap gosh'
alias chrome='open -a Google\ Chrome'
alias i='pry'
alias rspec='rspec -c'
alias jakld='rlwrap java -jar ~/src/scheme/jakld/jakld.jar'
alias jak='jakld'
alias pad='padrino'
alias gei='gem install'
alias ges='gem search -r'
alias geu='gem uninstall'

alias ra='rails'
alias ras='rails s'
alias rac='rails c'
alias rag='rails g'
alias mig='rake db:migrate'
alias rusc='ruby script/console'

alias ru='ruby'
alias rash='rails-sh'
alias bun='bundle'
alias bunin='bundle install'
alias bune='bundle exec'
alias m='mate'

alias cstop='/var/cassandra/cstop.sh'
alias cstart='/var/cassandra/cstart.sh'

alias svn-push='git stash && git svn dcommit && git stash pop'
alias svn-pull='git stash && git svn rebase && git stash pop'

alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log'
alias gd='git diff'
alias gb='git branch'
alias gch='git checkout'
alias gr='git reset'

alias gcc='gcc -Wall'
alias g++='g++ -Wall'

alias tmux='tmux -2'

# copy storage-conf.xml
alias cpst='sed -e "s/<!-- SavedCachesDirectory>/<SavedCachesDirectory>/g" config/storage-conf.xml | sed -e "s/<\/SavedCachesDirectory -->/<\/SavedCachesDirectory>/g" > /var/cassandra/conf/storage-conf.xml' 

# vim key-bind
bindkey -v

autoload -U compinit
compinit

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

setopt auto_cd
setopt auto_pushd 
setopt correct
setopt list_packed
setopt noautoremoveslash
setopt nolistbeep
setopt nobeep
setopt complete_aliases

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source ~/perl5/perlbrew/etc/bashrc
