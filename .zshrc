# --------------------------------------------------------------
# 1️⃣ Basic Oh My Zsh setup
# --------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"

# Use custom Eastwood theme with hostname
ZSH_THEME="eastwood-with-hostname"

# Add custom themes directory
ZSH_CUSTOM="$HOME/.zsh/custom"

source $ZSH/oh-my-zsh.sh
# --------------------------------------------------------------
# 2️⃣ Your environment variables / aliases / plugins (unchanged)
# --------------------------------------------------------------
export AWS_DEFAULT_PROFILE=staging
source "$HOME/.env"
source "$HOME/.local/bin/env"

CASE_SENSITIVE="true"
REPORTTIME=3
export UPDATE_ZSH_DAYS=13
export EDITOR="nvim"

plugins=(
  git docker-compose git-flow history lol npm sudo asdf \
  zsh-interactive-cd command-time kubectl
)

alias tmux='TERM=screen-256color-bce tmux'
alias dco='docker-compose'
alias tf='terraform'
alias gitclean='git branch | grep -v "master" | xargs git branch -D '
alias vim=nvim
alias cat=bat
alias kap='kubectl apply -f'
alias edukey='sh ~/.config/keyboard/edukey.sh'
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# --------------------------------------------------------------
# 3️⃣ Completion / fzf (keep the order you had)
# --------------------------------------------------------------
autoload -U compinit && compinit
fpath=(~/.zsh/functions $fpath)   # custom functions first
source <(fzf --zsh)

if [[ -f ~/.zsh/functions/_uv ]]; then
  source ~/.zsh/functions/_uv
fi

# --------------------------------------------------------------
# 4️⃣ More env vars (unchanged)
# --------------------------------------------------------------
# WARNING: This is a placeholder token, not a real secret.
# For real tokens, set them in your environment or in ~/.env file
# which is already sourced above and should be in .gitignore
export NPM_GITHUB_TOKEN=noesuntoken
export REDIS_IN_MEMORY_VERSION=6.0.10
ZSH_COMMAND_TIME_MIN_SECONDS=3
ZSH_COMMAND_TIME_MSG="Execution time: %s sec"
ZSH_COMMAND_TIME_COLOR="cyan"
ZSH_COMMAND_TIME_EXCLUDE=(vim mcedit)

export KUBECONFIG="${HOME}/.kube/config"

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Google Cloud SDK (keep both lines – they are harmless)
if [ -f '/Users/eduardosanchez/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then
  . '/Users/eduardosanchez/Downloads/google-cloud-sdk/completion.zsh.inc'
fi

# fnm (new NVM)
eval "$(fnm env --use-on-cd)"
export PATH="/Users/eduardosanchez/.local/state/fnm_multishells/56576_1733171548825/bin:$PATH"
export FNM_MULTISHELL_PATH="/Users/eduardosanchez/.local/state/fnm_multishells/56576_1733171548825"
export FNM_VERSION_FILE_STRATEGY="local"
export FNM_DIR="/Users/eduardosanchez/.local/share/fnm"
export FNM_LOGLEVEL="info"
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
export FNM_COREPACK_ENABLED="false"
export FNM_RESOLVE_ENGINES="true"
export FNM_ARCH="arm64"

rehash

# ImageMagick for Neovim
export DYLD_FALLBACK_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_FALLBACK_LIBRARY_PATH"

# Docker Desktop completions
fpath=(/Users/eduardosanchez/.docker/completions $fpath)
autoload -Uz compinit && compinit

# pnpm
export PNPM_HOME="/Users/eduardosanchez/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Google Cloud SDK path helper (again, safe to keep)
if [ -f '/Users/eduardosanchez/Downloads/google-cloud-sdk/path.zsh.inc' ]; then
  . '/Users/eduardosanchez/Downloads/google-cloud-sdk/path.zsh.inc'
fi

# macOS sqlite override
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib"
export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include"

# LM Studio CLI (append to PATH)
export PATH="$PATH:/Users/eduardosanchez/.lmstudio/bin"

# ----------------------------------------------------------------
# 6️⃣ Helper function you already had (unchanged)
# ----------------------------------------------------------------
vv() {
  local config=$(fd --max-depth 1 --glob 'nvim*' ~/.config |
                 fzf --prompt="Neovim Configs > " --height=~50% \
                     --layout=reverse --border --exit-0)
  [[ -z $config ]] && echo "No config selected" && return
  NVIM_APPNAME=$(basename "$config") nvim "$@"
}
