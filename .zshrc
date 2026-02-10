# ~/.zshrc

# 1. Environment & History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# 2. Plugins (Arch Linux paths)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# 3. Prompt (Starship)
eval "$(starship init zsh)"

# 4. Smart Navigation (Zoxide)
eval "$(zoxide init zsh)"

# 5. Aliases (Same as your bashrc)
alias grep='grep --color=auto'
alias ls='eza --tree --icons --group-directories-first --level=1'
alias ll='eza -l --icons --group-directories-first'
alias tree='eza --tree --icons'
alias cd='z'

# 6. System Info
fastfetch

# 7. Professional Tool Overrides
alias cat='bat'
alias top='btop'
alias help='tldr'

# 8. Aliases
alias fa='fastfetch'
alias conf='micro ~/.config/hypr/hyprland.conf'
alias zconf='micro ~/.zshrc'
alias rb='killall waybar; waybar &'

alias c='cursor --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations'
export PATH="$HOME/.local/bin:$PATH"
