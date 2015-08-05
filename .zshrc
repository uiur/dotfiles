fpath=($HOME/.zsh-completions /usr/local/share/zsh/site-functions $fpath)

autoload colors
colors

export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'

autoload -U compinit
compinit

autoload -U promptinit && promptinit
prompt pure

## aliases
alias v='vim'
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
alias ios-simulator='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'

alias -g G="| grep"
alias -g L="| less -R"

alias memo='vi ~/memo/'
alias gosh='rlwrap gosh'
alias chrome='open -a Google\ Chrome'
alias canary='open -a Google\ Chrome\ Canary'
alias i='pry'
alias rspec='rspec -c'
alias jakld='rlwrap java -jar ~/Code/Scheme/jakld.jar'
alias jak='jakld'
alias pad='padrino'
alias gei='gem install'
alias ges='gem search -r'
alias geu='gem uninstall'

alias be='bundle exec'

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

eval "$(hub alias -s)"

alias g='git'
alias ga='git add'
alias gap='git add -p'
alias gc='git commit'
alias gp='git push'
alias gl='git log'
alias gd='git diff'
alias gb='git branch'
alias gch='git checkout'
alias gr='git reset'
alias gcl='git reset'

alias gcc='gcc -Wall'
alias g++='g++ -Wall'
alias clang='clang -Wall'

alias tmux='tmux -2'
alias nw='/Applications/node-webkit.app/Contents/MacOS/node-webkit'

# peco utility function
p() { peco | while read LINE; do $@ $LINE; done }

# vim key-bind
bindkey -v

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
setopt transient_rprompt
setopt automenu
setopt auto_param_keys
setopt complete_in_word
setopt auto_resume
setopt prompt_subst
setopt extended_glob

function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    ls

    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        echo
        echo -e "\e[0;33m--- git status ---\e[0m"
        git status -sb
    fi
    zle reset-prompt
    return 0
}
zle -N do_enter
bindkey '^m' do_enter

. `brew --prefix`/etc/profile.d/z.sh
function precmd_z () {
 z --add "$(pwd -P)"
}
precmd_functions=($precmd_functions precmd_z)

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###


# Credits to npm's. Awesome completion utility.
#
# Bower completion script, based on npm completion script.

###-begin-bower-completion-###
#
# Installation: bower completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: bower completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _bower_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           bower completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _bower_completion bower
elif type compdef &>/dev/null; then
  _bower_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 bower completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _bower_completion bower
elif type compctl &>/dev/null; then
  _bower_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       bower completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _bower_completion bower
fi
###-end-bower-completion-###

[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh  # This loads NVM
source /Users/zat/Code/zaw/zaw.zsh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
source '/Users/zat/google-cloud-sdk/path.zsh.inc'

# peco
if which peco &> /dev/null; then
  function peco_select_history() {
    local tac
    (which gtac &> /dev/null && tac="gtac") || \
    (which tac &> /dev/null && tac="tac") || \
    tac="tail -r"
    BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER # move cursor
    zle -R -c       # refresh
  }

  zle -N peco_select_history
  bindkey '^R' peco_select_history

  function peco-git-branch-selector() {
    local tac
    if which tac > /dev/null; then
      tac="tac"
    else
      tac="tail -r"
    fi

    git rev-parse --git-dir >/dev/null 2>&1
    if [[ $? == 0 ]]; then
      BUFFER=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)"\
        | peco --query "$LBUFFER")
      if [[ $? == 0 ]];then
        BUFFER=$(echo $BUFFER)
        BUFFER=$(git checkout $BUFFER)
        CURSOR=$#BUFFER
      fi
    fi
    zle -R -c
  }

  alias gco="peco-git-branch-selector"
fi

# added by travis gem
[ -f /Users/zat/.travis/travis.sh ] && source /Users/zat/.travis/travis.sh

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/zat/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

source /Users/zat/Code/shr/shr
