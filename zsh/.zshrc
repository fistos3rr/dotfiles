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
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '!'
zstyle ':vcs_info:git:*' formats '%b%u%c '
zstyle ':vcs_info:git:*' actionformats '%b%u%c '

precmd() {
    vcs_info
}

setopt PROMPT_SUBST
PROMPT=$'\n''%F{green}%n@%m%f:%F{blue}%~%f ${vcs_info_msg_0_}'$'\n''%F{165}%%%f '
# END PROMPT SETTINGS

