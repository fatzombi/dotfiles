alias cat='bat'
alias reload!='. ~/.zshrc'
alias cls='clear'

alias vi='nvim'
alias vim='nvim'

alias d='docker $*'
alias d-c='docker-compose $*'

alias chmox='chmod +x'

# Pipe my public key to my clipboard. Stolen from https://github.com/holman
alias pubkey="more ~/.ssh/id_ed25519.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

alias fz_http="python -m http.server"
alias fz_pinglisten='sudo tcpdump ip proto \\icmp'

alias history="history 1"
