# 環境変数
export LANG=ja_JP.UTF-8

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# 直前のコマンドの重複を削除
setopt hist_ignore_dups
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# 同時に起動したzshの間でヒストリを共有
setopt share_history

setopt nonomatch

# 補完機能を有効にする
autoload -Uz compinit
compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補を詰めて表示
setopt list_packed
# 補完候補一覧をカラー表示
zstyle ':completion:*' list-colors ''

# コマンドのスペルを訂正
setopt correct
# ビープ音を鳴らさない
setopt no_beep

# prompt
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd() { vcs_info }
PROMPT='%m:%F{green}%~%f %n %F{yellow}$%f '
RPROMPT='${vcs_info_msg_0_}'

# alias
alias ls='ls -aF'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias cat='cat -n'
alias less='less -NM'

alias g='git'

alias convey='GO_ENV=test $GOPATH/bin/goconvey'


export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
#The original version is saved in .bash_profile.pysav
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

#Setting PATH for Python 3.6
#The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

#Setting PATH for Python 3.6
#The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH


PYENV_ROOT=~/.pyenv
export PATH=$PATH:$PYENV_ROOT/bin
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


#for Golang
export GOPATH=$HOME/dev
export PATH=$PATH:$GOPATH/bin

#for Ruby
#export PATH="~/.rbenv/shims:/usr/local/bin:$PATH"
#eval "$(rbenv init -)"
#export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#ElasticSerch
export ELASTICPATH=/usr/local/Cellar/elasticsearch/2.2.0_1/libexec/bin



#ethereum setting
test -r /sw/bin/init.sh && . /sw/bin/init.sh
export PATH=$PATH:$HOME/.nodebrew/current/bin




#ghq
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

#peco
bindkey '^]' peco-src

function peco-src() {
    local src=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$src" ]; then
        BUFFER="cd $src"
        zle accept-line
    fi
    zle -R -c
}
zle -N peco-src


#this is for webapp study
#apikey for BIG HUGE LABS ドメイン名とるやつ
export BHT_APIKEY=2356130d921b65ac843210403370f3a6



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/Shunsuke/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/Shunsuke/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/Shunsuke/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/Shunsuke/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="/Users/Shunsuke/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
