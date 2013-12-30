#!/bin/bash

# force 256 colors
if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

# Change the window title of X terminals
case ${TERM} in
        xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix)
                PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
		use_color=true
                ;;
        screen)
                PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
		use_color=true
                ;;
esac

if ${use_color} ; then
	# set color prompt
        if [[ ${EUID} == 0 ]] ; then
                PS1='\[\033[01;31m\]\t \h[\j]\[\033[01;34m\] \W \$\[\033[00m\] '
        else
                PS1='\[\033[01;32m\]\t \u@\h[\j]\[\033[01;34m\] \w \$\[\033[00m\] '
        fi

	# enable ls colors
        alias ls='ls -G'
	# enable grep color
        alias grep='grep --colour=auto'
else
        if [[ ${EUID} == 0 ]] ; then
                # show root@ when we don't have colors
                PS1='\u@\h \W \$ '
        else
                PS1='\u@\h \w \$ '
        fi
fi

# Try to keep environment pollution down, EPA loves us.
unset use_color

# improve bash history ;)
shopt -s histappend
PROMPT_COMMAND=$PROMPT_COMMAND';history -a'
# Store 10000 commands in bash history
export HISTFILESIZE=100000
export HISTSIZE=100000
# Don't put duplicate lines in the history
export HISTCONTROL=ignoredups


export EDITOR=vim
export VIM_APP_DIR=/Applications

export BORIS_TENT=~/.tent/
export BIN=~/.tent/bin
export PATH=$BORIS_TENT/bin:$PATH

# improve less (if not already)
if [[ -z "$LESSOPEN" ]] ; then
  export LESSOPEN="|$BORIS_TENT/bin/lesspipe.sh %s"
fi
