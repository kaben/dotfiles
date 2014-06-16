# By default, we want this to be set.
# Even for non-interactive, non-login shells.
if [ `id -gn` = `id -un` -a `id -u` -gt 99 ]; then
    umask 002
else
    umask 022
fi

# Are we an interactive shell?
if [ "$PS1" ]; then
    # slightly more sane terminal line settings...
    stty erase ^?
    if [ -x /usr/bin/tput ]; then
      if [ "x`tput kbs`" != "x" ]; then # We can't do this with "dumb" terminal
        stty erase `tput kbs`
      elif [ -x /usr/bin/wc ]; then
        if [ "`tput kbs|wc -c `" -gt 0 ]; then # We can't do this with "dumb" terminal
          stty erase `tput kbs`
        fi
      fi
    fi
    PS1="\\$ "

    if [ "x$SHLVL" != "x1" ]; then # We're not a login shell
        for i in /etc/profile.d/*.sh; do
        if [ -x $i ]; then
            . $i
        fi
    done
    fi
fi

# If not running interactively, don't do anything else.
[[ $- != *i* ]] && return

# Source private bash files (private in that they don't live in my github).
if [[ -f ~/.bash_private ]]; then
  source ~/.bash_private
fi

#Prompt and prompt colors
# 30m - Black
# 31m - Red
# 32m - Green
# 33m - Yellow
# 34m - Blue
# 35m - Purple
# 36m - Cyan
# 37m - White
# 0 - Normal
# 1 - Bold
function prompt {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
  local RESET="\[\033[00m\]"

  # two line prompt for skinny windows
  if [[ "$1" = "2" ]]; then
    export PS1="\n$BLACKBOLD[\t] $CYANBOLD\w\n  $GREENBOLD\u$RESET@$PURPLEBOLD\h$RESET: \\$ "
  else
  # one line prompt for wide ones (default)
    export PS1="\n$BLACKBOLD[\t]$GREENBOLD \u$WHITEBOLD@$PURPLEBOLD\h$RESET:$CYANBOLD\w$RESET \\$ "
  fi
}
prompt

# Configure command history
shopt -s histappend
export HISTSIZE=5000
export HISTFILESIZE=5000

# I prefer using text-vierwer "less" to read manpages...
export PAGER=less
# Don't clear screen when closing less.
export LESS="-X"

# Configure rsync -- remote files synchronization.
export RSYNC_RSH=ssh

# In general use vim as editor.
export EDITOR=vim

if [ -z "$LOC_BASE" ]; then
  export LOC_BASE="/usr/local"
  export PATH="$LOC_BASE/bin:$LOC_BASE/sbin:$PATH"
  export MANPATH="$LOC_BASE/share/man:$MANPATH"
  export INFODIR="$LOC_BASE/share/info:$INFODIR"
  export INFOPATH="$LOC_BASE/share/info:$INFOPATH"
fi

if [ -z "$ACTIVE_PERL_BASE" ]; then
  export ACTIVE_PERL_BASE="/usr/local/ActivePerl-5.14/"
  export PATH="$ACTIVE_PERL_BASE/bin:$PATH"
  export MANPATH="$ACTIVE_PERL_BASE/share/man:$MANPATH"
  export INFODIR="$ACTIVE_PERL_BASE/share/info:$INFODIR"
  export INFOPATH="$ACTIVE_PERL_BASE/share/info:$INFOPATH"
fi

if [ -z "$DEVELOPER_BASE" ]; then
  export DEVELOPER_BASE="/Developer/usr"
  export PATH="$DEVELOPER_BASE/bin:$PATH"
  export MANPATH="$DEVELOPER_BASE/share/man:$MANPATH"
  export INFODIR="$DEVELOPER_BASE/share/info:$INFODIR"
  export INFOPATH="$DEVELOPER_BASE/share/info:$INFOPATH"
fi

if [ -z "$ANACONDA_BASE" ]; then
  export ANACONDA_BASE="/Users/kaben/anaconda"
  #export PATH="$ANACONDA_BASE/bin:$PATH"
  #export MANPATH="$ANACONDA_BASE/share/man:$MANPATH"
  #export INFODIR="$ANACONDA_BASE/share/info:$INFODIR"
  #export INFOPATH="$ANACONDA_BASE/share/info:$INFOPATH"
fi

#if [ -z "$MACPORTS_BASE" ]; then
#  export MACPORTS_BASE="/macports/local"
#  export PATH="$MACPORTS_BASE/bin:$PATH"
#  export MANPATH="$MACPORTS_BASE/share/man:$MANPATH"
#  export INFODIR="$MACPORTS_BASE/share/info:$INFODIR"
#  export INFOPATH="$MACPORTS_BASE/share/info:$INFOPATH"
#fi

if [ -d "$HOME/.tokaidoapp" ]; then
  source "$HOME/.tokaidoapp/tokaidoapp.sh"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

