local return_code="%(?.%{$fg_bold[green]%}✔ %{$fg[green]%}0 %{$reset_color%}.%{$fg_bold[red]%}✘ %{$fg[red]%}%? %{$reset_color%})"

PS1='%{${fg[cyan]}%}[%n@%m] %{${fg[green]}%}[%3~] $(git_prompt_info)
${return_code}%{${fg_bold[blue]}%}%#%{${reset_color}%} '

RPS1='$(vi_mode_prompt_info)'
MODE_INDICATOR="%{$fg_bold[magenta]%}<%{$reset_color%}%{$fg[magenta]%}<<%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

# TODO use 265 colors
#MODE_INDICATOR="$FX[bold]$FG[020]<$FX[no_bold]%{$fg[blue]%}<<%{$reset_color%}"
# TODO use two lines if git

