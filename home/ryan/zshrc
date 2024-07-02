# Enable command auto-correction
setopt CORRECT

# Aliases
alias ll='ls -lah'
alias gs='git status'
alias gp='git pull'
alias gpush='git push'
alias gc='git commit -m'
alias v='nvim'

# History settings
HISTSIZE=5000
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
autoload -Uz compinit; compinit

# Syntax highlighting
ZSH_SYNTAX_HIGHLIGHTING_DIR="$HOME/.zsh/zsh-syntax-highlighting"
if [ -d "$ZSH_SYNTAX_HIGHLIGHTING_DIR" ]; then
    source "$ZSH_SYNTAX_HIGHLIGHTING_DIR/zsh-syntax-highlighting.zsh"
fi

# Autosuggestions
ZSH_AUTOSUGGESTIONS_DIR="$HOME/.zsh/zsh-autosuggestions"
if [ -d "$ZSH_AUTOSUGGESTIONS_DIR" ]; then
    source "$ZSH_AUTOSUGGESTIONS_DIR/zsh-autosuggestions.zsh"
fi

# fzf-tab
FZF_TAB_DIR="$HOME/.zsh/fzf-tab"
if [ -d "$FZF_TAB_DIR" ]; then
    source "$FZF_TAB_DIR/fzf-tab.plugin.zsh"
fi

# Set editor to Neovim
export EDITOR='nvim'
export VISUAL='nvim'

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"
