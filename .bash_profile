##############################################################################################
# Vim is the default editor
export VISUAL=vim
export EDITOR="$VISUAL"

##############################################################################################
# virtualenvwrapper startup
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

##############################################################################################
# Test if .git-completion.bash exists, iff  it does, read and execute .git-completion.bash (@crawfishpress)
test -f ~/.git-completion.bash && . $_

##############################################################################################
# TERMINAL COLORING
# \[\e[1;32m\] => bold green, \[\e[0;32m\] => green, \[\e[0;33m\] => yellow
# \[\e[1;33m\] => bold yellow, \[\e[0;31m\] => red, \[\e[0m\] => clear
# \u => username, \h => host, \w => path, \$ => prompt
export CLICOLOR=1                                                                           # turn terminal coloring on
export LSCOLORS=gxfxcxdxbxegedabagacad;                                                     # specify terminal colors per attribute
PS1='\[\e[1;32m\]\u\[\e[0;32m\]@\h: \[\e[0;33m\]\w \[\e[1;33m\]\$ \[\e[0m\]'                # prompt coloring
export SUDO_PS1='\[\e[1;31m\]\u\[\e[0;31m\]@\h: \[\e[0;33m\]\w \[\e[1;33m\]\$ \[\e[0m\]'    # root prompt coloring

##############################################################################################
# Aliases
alias vi="vim"
alias openmason="ssh blane3@mason.gmu.edu"
alias openzeus="ssh blane3@zeus.ite.gmu.edu"
alias cb="cd ~/chef-repo/cookbooks"
alias db="cd ~/chef-repo/data_bags"
alias ro="cd ~/chef-repo/roles"

##############################################################################################
# Notification system for Kitchen on Apple devices (adaption of original script by @kbvincent)
kit() {
    if [ $# -eq 0 ]; then
        echo "No arguments supplied"
    else
        kitchen $1 $2
        if [ $? -eq 0 ]; then
            osascript -e "display notification \"Kitchen $1 $2 successful\" with title \"Kitchen Run Completed\""
        else
            osascript -e "display notification \"Kitchen $1 $2 failed\" with title \"Kitchen Run Failed\""
        fi
    fi
}
eval "$(chef shell-init bash)"

