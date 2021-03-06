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
# Test if .git-completion.bash exists, if it does, read and execute .git-completion.bash
test -f $HOME/git/contrib/completion/git-completion.bash && . $_

##############################################################################################
# TERMINAL COLORING
# \[\e[1;32m\] => bold green, \[\e[0;32m\] => green, \[\e[0;33m\] => yellow
# \[\e[1;33m\] => bold yellow, \[\e[0;31m\] => red, \[\e[0m\] => clear
# \u => username, \h => host, \w => path, \$ => prompt
export CLICOLOR=1 # turn terminal coloring on
export LSCOLORS=gxfxcxdxbxegedabagacad; # specify terminal colors per attribute
PS1='\[\e[1;32m\]\u\[\e[0;32m\]@\h: \[\e[0;33m\]\w \[\e[1;33m\]\$ \[\e[0m\]' # prompt coloring
export SUDO_PS1='\[\e[1;31m\]\u\[\e[0;31m\]@\h: \[\e[0;33m\]\w \[\e[1;33m\]\$ \[\e[0m\]' # root prompt coloring

##############################################################################################
# Aliases
alias vi="vim"
alias cb="cd ~/chef-repo/cookbooks"
alias db="cd ~/chef-repo/data_bags"
alias ro="cd ~/chef-repo/roles"

##############################################################################################
# Kitchen shortcut
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

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export GPG_TTY=$(tty)
source "$HOME/.cargo/env"
