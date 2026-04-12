
# ENV
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY   
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY

# AUTOCOMPLETE
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors 'ma=38;5;109'
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt NO_CLOBBER
unsetopt BEEP	# NO FUCKING BEEP
REPORTTIME=1


# PLUGINS

#AUTO SUGGESTIONS
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#9aab9e'

#SINTAX HIGHLIGHTING
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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

# EASY NAVIGATION
eval "$(zoxide init zsh)"

# ALIAS
alias grep='grep --color=never'
alias ls='eza --tree --group-directories-first --level=1 --color=never'
alias ll='eza -l --group-directories-first --color=never'
alias tree='eza --tree --color=never'
alias cd='z'
alias f='fastfetch --logo-color-1 white --logo-color-2 white'
alias cat='bat --theme=ansi --style=plain'
alias top='btop'
alias help='tldr'
alias conf='micro ~/.config/hypr/hyprland.conf'
alias zconf='micro ~/.zshrc'
alias rb='killall waybar; waybar &'
alias download='cd /home/iks/Music && yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata'
alias hydra='/home/iks/Documents/Games/Hydra/hydralauncher-3.9.4.AppImage'


# BINDINGS
bindkey '^[[1;5C' forward-word          # Ctrl+Right: palabra siguiente
bindkey '^[[1;5D' backward-word         # Ctrl+Left: palabra anterior
bindkey '^U' backward-kill-line         # Ctrl+U: borrar hasta inicio de línea (como bash)

# PATHS
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# 13. Bienvenida + fastfetch (cada vez que abres una terminal)
[[ -o interactive ]] && { print -P '%F{#9aab9e}%D{%Y-%m-%d %H:%M} —%f'; f }
export PATH="$HOME/.npm-global/bin:$PATH"
