##############################################################################
# Prompt formatting                                                          #
##############################################################################
autoload -Uz vcs_info # enable vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# zstyle ':vcs_info:*' formats " %s(%F{green}%b%u%c%f)"
zstyle ':vcs_info:*' formats "-[%b%u%c]"
# Enable completion debugging:
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

precmd () {
  vcs_info
  # Print a new line before the prompt, but only if it is not the first line (kali)
  if [ -z "$_NEW_LINE_BEFORE_PROMPT" ]; then
      _NEW_LINE_BEFORE_PROMPT=1
  else
      print ""
  fi
} # always load before displaying the prompt

# Original: %n@%m %1~ %#
# Show username@machine pwd git(branch) $
setopt prompt_subst
# git/version control system (vcs) details only
# PS1='%n@%m:%F{blue}%1~%f${vcs_info_msg_0_} $ '
# two-liner
PS1=$'%F{%(#.blue.green)}┌──${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))─}(%B%F{%(#.red.blue)}%n@%m%b%F{%(#.blue.green)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}]${vcs_info_msg_0_}\n└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '

# Enable custom autocompletes
autoload -Uz compinit && compinit

##############################################################################
# Aliases                                                                    #
##############################################################################

alias python=/usr/local/bin/python3.10

# Enable opening a file in Chrome from the command line easily
alias chrome="open -a 'Google Chrome'"

# Enable colors in "ls" command output and add "/" to directories
alias ls="ls -Glahp"
alias fabric='fabric-ai'


export PATH="/usr/local/opt/node@18/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/node@18/lib"
export CPPFLAGS="-I/usr/local/opt/node@18/include"

export HOMEBREW_NO_AUTO_UPDATE=1
