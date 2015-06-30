# Created by newuser for 4.3.10
# zsh最強の2行
autoload -U compinit vcs_info
compinit
# prompt
PROMPT='[%F{green}%T%f %F{6}%n@%M%f %F{3}%~%f ]
-> $ '
#zstyle ':vcs_info:*' formats '[%b]'
#zstyle ':vcs_info:*' actionformats '[%b|%a]'
#precmd () {
#           psvar=()
#               LANG=en_US.UTF-8 vcs_info
#                   [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
#}
# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
#ディレクトリ名だけでcdする
setopt auto_cd
#vcs info
#
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
        psvar=()
        LANG=en_US.UFT-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"
#alias
alias psr='php -d include_path=/home/y/lib/php22/pear `which phpcs` --standard=PSR2'
alias gga="log --graph --all --abbrev-commit --date=relative --pretty=format:'%C(red)%h %C(reset)-%C(yellow)%d%Creset %s %Cgreen(%cr) %C(blue)[%an] %C(bold blue)'"
alias la='ls -a'
alias mkdir='mkdir -p'
alias -g L='| less'
alias -g G='| grep'
