##############################################################################################
# Vim is the default editor
export VISUAL=vim
export EDITOR="$VISUAL"

##############################################################################################
# virtualenvwrapper startup
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

