export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=5000
export SAVEHIST=5000
export EDITOR='vim'
export VISUAL='vim'

if [[ $(uname) == "Darwin" ]]; then
  export PATH="/opt/homebrew/sbin:/opt/homebrew/bin:$PATH"
fi

if command -v go > /dev/null; then
  export GOBIN="$HOME/go/bin"
  export PATH="$GOBIN:$PATH"
fi

if command -v dotnet > /dev/null; then
  export PATH="$HOME/.dotnet/tools:$PATH"
fi
