# dotfiles
These dotfiles are a personal backup of my system, made with :heart:

## dependencies
- [atom](https://atom.io/)
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
- [iterm 2](https://www.iterm2.com/)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

## exported secrets
- stored in ~/secrets.sh

## installation
The following commands can be run on **mac** to get and install the dotfiles:
```
git clone https://github.com/bridgetlane/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
rake install
```
A backup of any previously existing dotfiles will be created in the folder .old_dotfiles_backup

### install notes
- iterm is the [darkside](http://iterm2colorschemes.com/) theme
- set iterm non-ASCII font to 14pt source code pro for powerline with anti-aliased selected
- set iterm regular font to 14pt monaco with anti-aliased selected
