# Exports
export DOTFILES=$HOME/src/dotfiles
export ZSH=$DOTFILES/zsh
export PROJECTS=$HOME/src

source $ZSH/options.zsh
source $ZSH/variables.zsh
source $ZSH/completion.zsh
source $ZSH/aliases.zsh
source $ZSH/bindings.zsh
source $ZSH/syntax-highlighting.zsh
source $ZSH/suggestions.zsh
source $ZSH/prompt.zsh

# Functions
fpath=($ZSH/functions $fpath)
autoload -U $ZSH/functions/*(:t)

source $ZSH/plugins/antidote/antidote.zsh
if [ -f "$ZSH/zsh_plugins.zsh" ] && [ -s "$ZSH/zsh_plugins.zsh" ]; then
  source $ZSH/zsh_plugins.zsh
else
  echo "Rebundling antidote"
  antidote bundle < $ZSH/zsh_plugins.txt > $ZSH/zsh_plugins.zsh
  source $ZSH/zsh_plugins.zsh
fi
