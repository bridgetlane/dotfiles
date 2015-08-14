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

##############################################################################################
# Notification system for Vagrant on Apple devices
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
eval "$(chef shell-init bash)"

##############################################################################################
# ls a directory in your current directory
lsr() {
    if [ $# -eq 0 ]; then
        echo "Please give an argument"
    else
        cd $1 && ls -a && cd ..
    fi
}
