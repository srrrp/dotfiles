# ── Greeting ────────────────────────────────────────────
set -g fish_greeting # disable the welcome message

# ── Environment ─────────────────────────────────────────
set -gx CLICOLOR 1
set -gx BUN_INSTALL "$HOME/.bun"

# Same resulting order as your zsh config (last one added ends up first)
fish_add_path -g "$HOME/.local/bin"
fish_add_path -g /usr/local/bin
fish_add_path -g /opt/homebrew/bin
fish_add_path -g /opt/homebrew/sbin
fish_add_path -g "$BUN_INSTALL/bin"
fish_add_path -g "$HOME/.local/share/fnm"

# Hardcoded instead of `brew --prefix` (faster startup; it's always this on Apple Silicon)
set -gx LIBRARY_PATH $LIBRARY_PATH /opt/homebrew/lib

# ── Aliases ─────────────────────────────────────────────
alias pip pip3
alias python python3

# eza
alias ls eza
alias la 'eza --sort Name --long --all'
alias ll 'eza -lbF --git'
alias llm 'eza -lbGd --git --sort=modified'
alias lA 'eza -lbhHigUmuSa --time-style=long-iso --git --color-scale'
alias lx 'eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale'
alias lS 'eza -1'
alias lt 'eza --tree --level=2'

# ── fnm ─────────────────────────────────────────────────
if type -q fnm
    fnm env --use-on-cd --shell fish | source
end

# ── Starship ────────────────────────────────────────────
starship init fish | source
