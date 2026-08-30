source ~/.zsh_profile

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch
unsetopt autocd beep extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '{$HOME}/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# START PROMPT SETTINGS
autoload -Uz colors && colors
autoload -Uz add-zsh-hook vcs_info
setopt PROMPT_SUBST
add-zsh-hook precmd vcs_info

# vcs_info formats:
# %b - branch name
# %a - current action (rebase, merge etc)
# %s - type of vcs (git for example)
# %r - absolute root path of repo
# %R - relative root path of repo
# %c - staged changes (stagedstr)
# %u - unstaged changes (unstagedstr)
# %m - my custom string

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats       '(%F{83}%b%f%u%c%m)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c%m)'

zstyle ':vcs_info:git*+set-message:*' hooks git_status
function +vi-git_status() {
    if [[ -n $(git status --porcelain 2>/dev/null) || "${hook_com[staged]}" || "${hook_com[unstaged]}" ]]; then
        hook_com[branch]="%F{196}${hook_com[branch]}%f"
    fi
    local upstream=$(git rev-parse --abbrev-ref @{upstream} 2>/dev/null)
    if [[ -n $upstream ]]; then
        local ahead_behind=$(git rev-list --count --left-right @{upstream}...HEAD 2>/dev/null)
        if [[ -n $ahead_behind ]]; then
            local behind=$(echo $ahead_behind | awk '{print $1}')
            local ahead=$(echo $ahead_behind | awk '{print $2}')
            local upstream_info=""
            (( ahead > 0 || behind > 0 )) && upstream_info+="|"
            (( ahead > 0 )) && upstream_info+="a${ahead}"
            (( behind > 0 )) && upstream_info+="b${behind}"
        fi
    fi

    hook_com[misc]+="${upstream_info}"
}

PROMPT=$'\n''%F{green}%n@%m%f:%F{blue}%~%f'$'\n''${vcs_info_msg_0_}%F{165}>%f '
# END PROMPT SETTINGS

