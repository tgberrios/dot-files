# ~/.zshrc - WORDSTAR RETRO-TECH EDITION

# 1. Environment & History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY   # Escribir al instante (compartir entre terminales)
setopt SHARE_HISTORY        # Cargar historia de otras sesiones
setopt HIST_IGNORE_ALL_DUPS # No guardar ninguna línea duplicada en todo el historial
setopt HIST_IGNORE_SPACE    # No guardar líneas que empiezan con espacio
setopt HIST_VERIFY          # No ejecutar directo al hacer history expansion

# 2. Completado (menú con flechas; selección en zen)
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors 'ma=38;5;109'
setopt AUTO_CD              # "nombre_dir" sin escribir "cd"
setopt EXTENDED_GLOB        # Globs más potentes (#, ~, ^)
setopt NO_CLOBBER           # No sobrescribir con >; usar >| si quieres forzar
unsetopt BEEP               # Sin pitido al hacer Tab/Error
REPORTTIME=5                # Mostrar tiempo de ejecución si el comando tarda ≥5 s
setopt CORRECT              # Sugerir corrección de typos en comandos (usa CORRECT_ALL para incluir argumentos)

# 3. Plugins (Arch Linux paths)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#9aab9e'
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# fzf: Ctrl+R = búsqueda fuzzy en historial, Ctrl+T = archivos (si está instalado)
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

# --- AJUSTE RETRO PARA SYNTAX HIGHLIGHTING ---
ZSH_HIGHLIGHT_STYLES[command]='fg=white,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=white,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=white,underline'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=white,italic'
ZSH_HIGHLIGHT_STYLES[error]='fg=white,underline'

# 4. Kitty shell integration (URLs, saltar a prompts, título, etc.)
if [[ -n "$KITTY_INSTALLATION_DIR" ]]; then
  export KITTY_SHELL_INTEGRATION="enabled"
  autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
  kitty-integration
  unfunction kitty-integration
fi

# 5. Prompt: nombre del dir ("root" en /); › como separador (■ rojo si falló)
setopt PROMPT_SUBST
prompt_dir_precmd() { [[ $PWD == / ]] && PROMPT_DIR=root || PROMPT_DIR="${PWD:t}" }
precmd_functions+=(prompt_dir_precmd)
PROMPT='%F{white}${PROMPT_DIR} %B›%b %(?.%f.%F{red}■ %f)'

# 6. Smart Navigation (Zoxide)
eval "$(zoxide init zsh)"

# 7. Aliases (Limpios, sin iconos)
alias grep='grep --color=never'
alias ls='eza --tree --group-directories-first --level=1 --color=never'
alias ll='eza -l --group-directories-first --color=never'
alias tree='eza --tree --color=never'
alias cd='z'

# 8. System Info (alias "fa"; se ejecuta al abrir la terminal)
alias fa='fastfetch --logo-color-1 white --logo-color-2 white'

# 9. Professional Tool Overrides
alias cat='bat --theme=ansi --style=plain'
alias top='btop'
alias help='tldr'

# 10. Otros Aliases
alias conf='micro ~/.config/hypr/hyprland.conf'
alias zconf='micro ~/.zshrc'
alias rb='killall waybar; waybar &'
alias download='cd /home/iks/Music && yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata'
alias c='cursor --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations'

# 11. Key bindings
bindkey '^[[1;5C' forward-word          # Ctrl+Right: palabra siguiente
bindkey '^[[1;5D' backward-word         # Ctrl+Left: palabra anterior
bindkey '^U' backward-kill-line         # Ctrl+U: borrar hasta inicio de línea (como bash)

# 12. Paths
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# 13. Bienvenida + fastfetch (cada vez que abres una terminal)
[[ -o interactive ]] && { print -P '%F{#9aab9e}%D{%Y-%m-%d %H:%M} —%f'; fa }
