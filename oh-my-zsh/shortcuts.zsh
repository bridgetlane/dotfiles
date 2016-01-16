##############################################################################################
# Aliases
alias vi="vim"
alias openmason="ssh blane3@mason.gmu.edu"
alias openzeus="ssh blane3@zeus.ite.gmu.edu"
alias cb="cd ~/chef-repo/cookbooks"
alias db="cd ~/chef-repo/data_bags"
alias ro="cd ~/chef-repo/roles"
alias pep8l="pep8 --ignore=E501"
alias gss="git status --short --branch"
alias cc="colorize"
alias ucr="ls | xargs -I{} sh -c 'cd {} && echo {} && git checkout master && git fetch -p && git pull'" # update cookbooks in chef-repo
