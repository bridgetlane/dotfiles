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
eval "$(chef shell-init zsh)"

# Vagrant shortcut
vn() {
    if [ $# -eq 0 ]; then
        echo "No arguments supplied"
    else
        vagrant $1
        if [ $? -eq 0 ]; then
            osascript -e "display notification \"Vagrant $1 successful\" with title \"Vagrant Run Completed\""
        else
            osascript -e "display notification \"Vagrant $1 failed\" with title \"Vagrant Run Failed\""
        fi
    fi
}
eval "$(chef shell-init zsh)"
