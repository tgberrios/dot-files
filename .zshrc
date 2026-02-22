# ~/.zshrc - WORDSTAR RETRO-TECH EDITION

# 1. Environment & History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# 2. Plugins (Arch Linux paths)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- AJUSTE RETRO PARA SYNTAX HIGHLIGHTING ---
# En fondo negro, usamos blanco y negrita para resaltar sin usar colores
ZSH_HIGHLIGHT_STYLES[command]='fg=white,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=white,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=white,underline'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=white,italic'
ZSH_HIGHLIGHT_STYLES[error]='fg=white,underline' # Los errores no son rojos, son subrayados

# 3. Prompt (Estilo WordStar 1986)
# Usamos blanco (%F{white}) para que destaque sobre el fondo negro puro
PROMPT='%F{white}%1~ %B│%b %f'

# 4. Smart Navigation (Zoxide)
eval "$(zoxide init zsh)"

# 5. Aliases (Limpios, sin iconos)
alias grep='grep --color=never'
alias ls='eza --tree --group-directories-first --level=1 --color=never'
alias ll='eza -l --group-directories-first --color=never'
alias tree='eza --tree --color=never'
alias cd='z'

# 6. System Info (Forzamos blanco y negro)
# El logo de Arch ahora debe ser blanco o gris claro
alias fa='fastfetch --logo-color-1 white --logo-color-2 white'
fa

# 7. Professional Tool Overrides
# 'base16' suele ser colorido, para este look 'Monokai' o 'ansi' en bat es mejor
alias cat='bat --theme=ansi --style=plain'
alias top='btop'
alias help='tldr'

# 8. Otros Aliases
alias conf='micro ~/.config/hypr/hyprland.conf'
alias zconf='micro ~/.zshrc'
alias rb='killall waybar; waybar &'
alias download='cd /home/iks/Music && yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata'
alias c='cursor --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations'

# 9. Paths
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
[ -f "$HOME/.local/share/../bin/env" ] && . "$HOME/.local/share/../bin/env"
