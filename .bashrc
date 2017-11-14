#
# ~/.bashrc
#
. /usr/share/git/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export WORKON_HOME=~/.virtualenvs

source /usr/bin/virtualenvwrapper_lazy.sh
source /home/deneir/.git-completion.bash

# If not running interactively, don't do anything
alias ls='ls --color=auto'
alias grep='grep --color=always'

preexec () {
    # delete old prompt; one "\e[1A\e[K" per line of $PS1
    for (( i=0, l=$(echo -e $PS1 | wc -l) ; i < l ; i++ ))
    do
        echo -ne "\e[1A\e[K"
    done
    # replacement for prompt
    echo -ne "\e[37;2m[`date +"%l:%M"`] \e[0m"
    echo -ne "\e[31;1m$2 $ \e[0m"
    echo -n "$1"
    echo -e "\e[0m"
}

preexec_invoke_exec () {
    [ -n "$DONTCLEANPROMPT" ] && return
    DONTCLEANPROMPT=x
    [ -n "$COMP_LINE" ] && return  # do nothing if completing
    [ "$BASH_COMMAND" = "$PROMPT_COMMAND" ] && return # don't cause a preexec for $PROMPT_COMMAND
    local this_command=`history 1 | sed -e "s/^[ ]*[0-9]*[ ]*//g"`;
    [ "$BASH_COMMAND" = "_update_ps1" ] && local this_command=""
    local this_pwd=${PWD/#$HOME/\~}
    preexec "$this_command" "$this_pwd"
}

trap 'preexec_invoke_exec' DEBUG

function _update_ps1() {
    # Colors
    NIL='\[\033[00m\]'
    RED='\[\033[31m\]'
    GREEN='\[\033[32m\]'
    YELLOW='\[\033[33m\]'
    BLUE='\[\033[34m\]'
    PURPLE='\[\033[35m\]'
    CYAN='\[\033[36m\]'
    WHITE='\[\033[37m\]'

    # Get Virtual Env
    if [[ $VIRTUAL_ENV != "" ]]
        then
          # Strip out the path and just leave the env name
          venv=" ${BLUE}[${VIRTUAL_ENV##*/}]"
    else
          # In case you don't have one activated
          venv=''
    fi

    PS1="\[\e[$LINES;1H\]${CYAN}┌─${YELLOW}\u@\h${venv}${GREEN}$(__git_ps1 " (%s)")${RED} \w >\n${CYAN}└─╼ $ ${NIL}"

}

PROMPT_COMMAND='_update_ps1; unset DONTCLEANPROMPT'

# Import colorscheme from 'wal'
# (wal -r &)

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(ssh-agent)"
fi

