export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

test -f ~/.git-completion.bash && . $_

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad;
PS1='\e[1;32m\]\u\e[0;32m\]@\h: \e[0;33m\w\] \e[1;33m\$\] \[\e[0m\]'
export SUDO_PS1='\e[1;31m\]\u\e[0;31m\]@\h: \e[0;33m\w\] \e[1;33m\$\] \[\e[0m\]'

kit() {
    if [ $# -eq 0 ]
      then
        echo "No arguments supplied"
    else
        case $1 in
          test)
            kitchen $1 $2
            if [ $? -eq 0 ]; then
              osascript -e 'display notification "Kitchen $1 $2 successful" with title "Kitchen Run Completed”’
            else
              osascript -e 'display notification "Kitchen $1 $2 failed" with title "Kitchen Run Failed”’
            fi
            ;;
          converge)
            kitchen $1 $2
            if [ $? -eq 0 ]; then
              osascript -e 'display notification "Kitchen $1 $2 successful" with title "Kitchen Run Completed”’
            else
              osascript -e 'display notification "Kitchen $1 $2 failed" with title "Kitchen Run Failed”’
            fi
            ;;
          verify)
            kitchen $1 $2
            if [ $? -eq 0 ]; then
              osascript -e 'display notification "Kitchen $1 $2 successful" with title "Kitchen Run Completed”’
            else
              osascript -e 'display notification "Kitchen $1 $2 failed" with title "Kitchen Run Failed”’
            fi
            ;;
          *)
            kitchen $1 $2
            ;;
        esac
        
    fi
    
}
eval "$(chef shell-init bash)"
