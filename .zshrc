
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
zstyle ':completion:*' list-colors 'ma=38;5;245'
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt NO_CLOBBER
unsetopt BEEP	# NO FUCKING BEEP
REPORTTIME=1


# PLUGINS

#AUTO SUGGESTIONS
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#9e9e9e'

#SINTAX HIGHLIGHTING
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

# --- Syntax highlighting: solo grises / negro (sin verdes por defecto del plugin) ---
ZSH_HIGHLIGHT_STYLES[default]='none'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#505050,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#2a2a2a,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#000000,underline'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#303030'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#000000,underline'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#666666'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#000000,underline'
ZSH_HIGHLIGHT_STYLES[path]='fg=#000000,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#888888'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#707070'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#707070'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#808080'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#808080'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#4a4a4a'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#4a4a4a'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#4a4a4a'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#666666'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#666666'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#666666'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#666666'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#555555'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#888888'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#000000,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=#000000,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#000000,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#000000,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=#000000,bold'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#000000,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#5a5a5a'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#5a5a5a'
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=#000000,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=#404040,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=#505050,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=#606060,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=#707070,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-5]='fg=#808080,bold'

# 4. Kitty shell integration (URLs, saltar a prompts, título, etc.)
if [[ -n "$KITTY_INSTALLATION_DIR" ]]; then
  export KITTY_SHELL_INTEGRATION="enabled"
  autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
  kitty-integration
  unfunction kitty-integration
fi

# 5. Prompt: nombre del dir ("root" en /); › separador; ■ gris si el último comando falló
setopt PROMPT_SUBST
prompt_dir_precmd() { [[ $PWD == / ]] && PROMPT_DIR=root || PROMPT_DIR="${PWD:t}" }
precmd_functions+=(prompt_dir_precmd)
PROMPT='%F{#000000}${PROMPT_DIR} %B›%b %(?.%f.%F{#505050}■ %f)'

# EASY NAVIGATION
eval "$(zoxide init zsh)"

# ALIAS
alias grep='grep --color=never'
alias ls='eza --tree --group-directories-first --level=1 --color=never'
alias ll='eza -l --group-directories-first --color=never'
alias tree='eza --tree --color=never'
alias cd='z'
alias f='fastfetch --logo-color-1 "#707070" --logo-color-2 "#a0a0a0"'
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
[[ -o interactive ]] && { print -P '%F{#757575}%D{%Y-%m-%d %H:%M} —%f'; f }
export PATH="$HOME/.npm-global/bin:$PATH"
