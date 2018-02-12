# Path to your oh-my-zsh installation.
export ZSH=/Users/bnlane/.oh-my-zsh

# If you set this to "random", it'll load a random theme each time.
ZSH_THEME="robbyrussell"
DEFAULT_USER="bnlane"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"
plugins=(git \
         virtualenv \
         virtualenvwrapper \
         zsh-syntax-highlighting \
         colorize)

# For the zdh-completions plugin.
autoload -U compinit && compinit

# Load oh-my-zsh.
source $ZSH/oh-my-zsh.sh

export GOPATH=$HOME/golang

# User configuration.
export PATH=$PATH:/opt/chefdk/bin:/Users/bnlane/.chefdk/gem/ruby/2.1.0/bin:/opt/chefdk/embedded/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin

if [ -d $HOME/.local/bin ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# Preferred editor for local and remote sessions.
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

export PATH=$PATH:~/packer
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:/usr/local/bin/consul

# PATH for the Google Cloud SDK.
if [ -f /Users/bnlane/google-cloud-sdk/path.zsh.inc ]; then source /Users/bnlane/google-cloud-sdk/path.zsh.inc; fi

# gcloud command completion.
if [ -f /Users/bnlane/google-cloud-sdk/completion.zsh.inc ]; then source /Users/bnlane/google-cloud-sdk/completion.zsh.inc; fi

# Source secrets.
if [ -f $HOME/secrets.sh ]; then source $HOME/secrets.sh; fi

# Get git-completion script.
if [ ! -d $HOME/git ]; then
git clone git@github.com:git/git.git; fi

chmod 700 $HOME/git/contrib/completion/git-completion.zsh

if [ -f $HOME/git/contrib/completion/git-completion.zsh ]; then zstyle ':completion:*:*:git:*' script $HOME/git/contrib/completion/git-completion.zsh; fi

export FONTCONFIG_PATH=/etc/fonts
export FONTCONFIG_PATH=/etc/fonts
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export VAULT_ADDR=https://vault.service.us-east-1.gciconsul.com:8200

alias godoc='echo Go doc available at "http://localhost:6060/pkg/" add ?m=all to include unexported docs; godoc -http :6060 -notes "TODO"'
