# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
# End of lines configured by zsh-newuser-install

autoload -Uz promptinit; promptinit

#PROMPT=$'%F{95}[ %f%F{10}%B%n%b%f%F{red}@%f%F{208}%B%M%b%f%F{95} ]%f %F{165}%B%~%b%f \n%F{220}%B%# -->%b%f '

autoload -Uz vcs_info
precmd() {
  vcs_info
}

setopt PROMPT_SUBST


autoload colors
colors
#PS1="%~ %{%(#~$fg[red]~$fg[blue])%}%#%{$fg[default]%} "

#if [[ $EUID -ne 0 ]]; then
#	PROMPT=$'%F{95}[ %f%F{10}%B%n%b%f%F{red}@%f%F{208}%B%M%b%f%F{95} ]%f %F{165}%B%~%b%f \n%F{220}%B%# -->%b%f '
#else
#	PROMPT=$'%F{red}[ %f%F{10}%B%n%b%f%F{red}@%f%F{208}%B%M%b%f%F{red} ]%f %F{165}%B%~%b%f \n%F{220}%B%# -->%b%f '
#fi
#RPROMPT='[%T]'


if [[ $EUID -ne 0 ]]; then
	PROMPT=$'\n%F{10}[%f %B%F{11}%l%f%b %F{10}]-[%f %B%F{118}%n%b%f%F{10}@%f%B%F{220}%M%f%b %F{10}]%f %F{226}%B${vcs_info_msg_0_}%b%f %F{13}%~%f \n %B%F{10}%# >%f%b '
	RPROMPT=$'%? %B%F{14}[ %w ]%b%f-%B%F{14}[ %T ]%b%f'
else
	PROMPT=$'\n%F{9}[%f %B%F{11}%l%f%b %F{9}]-[%f %B%F{9}%n%b%f%F{10}@%f%B%F{220}%M%f%b %F{9}]%f %F{226}%B${vcs_info_msg_0_}%b%f %F{13}%~%f \n %B%F{9}%# >%f%b '
	RPROMPT=$'%? %B%F{4}[ %w ]%b%f-%B%F{4}[ %T ]%b%f'
fi


#PROMPT=$'%F{10}[%f %B%F{11}%l%f%b %F{10}]-[%f %B%F{118}%n%b%f%F{10}@%f%B%F{220}%M%f%b %F{10}]%f %~ \n %B%F{10}%# >%f%b '
#RPROMPT=$'%? %B%F{14}[ %w ]%b%f-%B%F{14}[ %T ]%b%f'

# Sources
source ~/.zshplugins/sudo.plugin.zsh
source ~/.zshplugins/aliases.zsh
source ~/.zshplugins/history.plugin.zsh

# Keybindings
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward   


#ChatGTP generated Settings/Aliasses etc.
# Load additional configuration files
if [ -d ~/.zshrc.d ]; then
    for file in ~/.zshrc.d/*; do
        source $file
    done
fi

# Custom settings
setopt autocd
setopt cdablevarS
setopt extendedglob
setopt nohup
setopt notify
setopt nobeep
setopt completealiases
#setopt nobanghist - idk what it does, but you won't be able to do !! because of it so I disable it.

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Auto-completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' format '%F{yellow}%d%f' '%F{blue}%p%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Aliases
alias ll='ls -alhF'
alias vi='vim'
alias grep='grep --color=auto'

# Color scheme
autoload -Uz colors && colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced


