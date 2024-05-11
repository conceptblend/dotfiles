##############################################################################
# Prompt formatting                                                          #
##############################################################################
autoload -Uz vcs_info # enable vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info*' formats " %s(%F{green}%b%u%c%f)"
precmd () {
  vcs_info
} # always load before displaying the prompt

# Original: %n@%m %1~ %#
# Show username@machine pwd git(branch) $
setopt prompt_subst
PS1='%n@%m:%F{blue}%1~%f${vcs_info_msg_0_} $ '

# Enable git autocomplete
autoload -Uz compinit && compinit

##############################################################################
# Aliases                                                                    #
##############################################################################

alias python=/usr/local/bin/python3.10

# Enable opening a file in Chrome from the command line easily
alias chrome="open -a 'Google Chrome'"

# Enable colors in "ls" command output and add "/" to directories
alias ls="ls -Glahp"
export PATH="/usr/local/opt/node@18/bin:$PATH"

