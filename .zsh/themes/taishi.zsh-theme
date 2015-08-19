PROMPT='$fg[white][ $fg[green]%T $fg[white]%n@%M $fg[cyan]:%~$(git_prompt_info)$fg[yellow]$(rvm_prompt_info)$fg[white] ]$reset_color
-> $ '
# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="$fg_bold[green]("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_CLEAN="✔"
ZSH_THEME_GIT_PROMPT_DIRTY="✗"
