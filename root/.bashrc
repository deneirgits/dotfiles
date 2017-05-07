#
# /root/.bashrc
#

# If not running interactively, don't do anything
alias ls='ls --color=auto'
preexec () {
    # delete old prompt; one "\e[1A\e[K" per line of $PS1
    for (( i=0, l=$(echo -e $PS1 | wc -l) ; i < l ; i++ ))
    do
        echo -ne "\e[1A\e[K"
    done
    # replacement for prompt
    echo -ne "\e[37;2m[`date +"%l:%M"`] \e[0m"
    echo -ne "\e[31;1m$2 # \e[0m"
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
    PS1="\[\e[$LINES;1H\]\[\e[1;32m\]┌─\[\e[1;35m\]\u@\h\[\e[1;32m\] \w >\n\[\e[1;32m\]└─╼\[\e[1;36m\] # "

}

PROMPT_COMMAND='_update_ps1; unset DONTCLEANPROMPT'
