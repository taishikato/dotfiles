zmodload -i zsh/complist
autoload -Uz compinit && compinit
zstyle ':completion:*:default' menu select=2
# Created by newuser for 4.3.10
# zsh最強の2行
autoload -U compinit vcs_info
compinit

#ディレクトリ名だけでcdする
setopt auto_cd

PROMPT='[%F{green}%T%f %F{white}%n@%M%f %F{3}%~%f ]
-> $ '
# git theming
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
        psvar=()
        LANG=en_US.UFT-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

export PATH="/Applications/MAMP/bin/php/php5.6.10/bin:$PATH"
export PATH="$PATH:`pwd`/flutter/bin"

## alias設定
alias gs='git status'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias la='ls -la'
alias ll="ls -l"
alias gga="git log --graph --all --abbrev-commit --date=relative --pretty=format:'%C(red)%h %C(reset)-%C(yellow)%d%Creset %s %Cgreen(%cr) %C(blue)[%an] %C(bold blue)'"
#alias atom="/Applications/Atom.app/Contents/Resources/app/atom.sh"
alias atom="/Applications/Atom Beta.app/Contents/Resources/app/atom.sh"
alias ghd='cd $(ghq list --full-path | peco)'
alias ee='exa -l'
alias ea='exa -la'

#=============================
# source zsh-syntax-highlighting
#=============================
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ "$(uname)" = 'Darwin' ]; then
    export LSCOLORS=xbfxcxdxbxegedabagacad
    alias ls='ls -G'
else
    eval `dircolors ~/.colorrc`
    alias ls='ls --color=auto'
fi

# composer
export PATH="$PATH:$HOME/.composer/vendor/bin"


HISTFILE=~/.zsh_history #履歴ファイルの設定
HISTSIZE=1000000 # メモリに保存される履歴の件数。(保存数だけ履歴を検索できる)
SAVEHIST=1000000 # ファイルに何件保存するか
setopt extended_history # 実行時間とかも保存する
setopt share_history # 別のターミナルでも履歴を参照できるようにする
setopt hist_ignore_all_dups # 過去に同じ履歴が存在する場合、古い履歴を削除し重複しない
setopt hist_ignore_space # コマンド先頭スペースの場合保存しない
setopt hist_verify # ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_reduce_blanks #余分なスペースを削除してヒストリに記録する
setopt hist_save_no_dups # histryコマンドは残さない
setopt hist_expire_dups_first # 古い履歴を削除する必要がある場合、まず重複しているものから削除
setopt hist_expand # 補完時にヒストリを自動的に展開する
setopt inc_append_history # 履歴をインクリメンタルに追加

function peco-select-history {
    BUFFER=`history -n -r 1 | peco --query "$LBUFFER"`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-select-history
bindkey '^r' peco-select-history

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

function peco-cdr() {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
bindkey '^Z' peco-cdr

#export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH:/usr/local/Cellar/yarn/1.10.1/bin"
#export PATH="$PATH:`yarn global bin`"
export PATH=$PATH:$HOME/.nodebrew/current/bin

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.nodebrew/node/:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/taishikato/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/taishikato/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/taishikato/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/taishikato/google-cloud-sdk/completion.zsh.inc'; fi
