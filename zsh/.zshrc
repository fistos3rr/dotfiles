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
zstyle ':vcs_info:git:*' formats       '(%F{83}%b%f%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'
zstyle ':vcs_info:git*+set-message:*' hooks git_is_dirty

function +vi-git_is_dirty() {
    if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
        hook_com[branch]="%F{196}${hook_com[branch]}%f"
    fi
}

PROMPT=$'\n''%F{green}%n@%m%f:%F{blue}%~%f'$'\n''${vcs_info_msg_0_}%F{165}>%f '
# END PROMPT SETTINGS

