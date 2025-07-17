export ZSH="$HOME/.oh-my-zsh"

export AWS_DEFAULT_PROFILE=staging

source $HOME/.env
source $HOME/.local/bin/env


ZSH_THEME="Eastwood"
CASE_SENSITIVE="true"
REPORTTIME=3

export UPDATE_ZSH_DAYS=13
export EDITOR="nvim"

plugins=(
  git
  docker-compose
  git-flow
  history
  lol
  npm
  sudo
  asdf
  zsh-interactive-cd
  command-time
  kubectl
)

alias tmux="TERM=screen-256color-bce tmux"
alias dco="docker-compose"
alias tf="terraform"
alias gitclean="git branch | grep -v "master" | xargs git branch -D "
alias vim=nvim
alias cat=bat
alias kap="kubectl apply -f"
alias edukey="sh ~/.config/keyboard/edukey.sh"
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
autoload compinit

# AUTOCOMPLETION SETUP (Corrected)
fpath=(~/.zsh/functions $fpath)  # Add your custom functions directory FIRST
autoload -Uz compinit && compinit   # Initialize Zsh completion
source <(fzf --zsh)                # fzf integration (moved)

# Source UV completion (after compinit)
if [[ -f ~/.zsh/functions/_uv ]]; then
  source ~/.zsh/functions/_uv
fi


export NPM_GITHUB_TOKEN=noesuntoken
export REDIS_IN_MEMORY_VERSION=6.0.10


# To npm install work when doing docker build locally
ZSH_COMMAND_TIME_MIN_SECONDS=3
ZSH_COMMAND_TIME_MSG="Execution time: %s sec"
ZSH_COMMAND_TIME_COLOR="cyan"
ZSH_COMMAND_TIME_EXCLUDE=(vim mcedit)

export KUBECONFIG="${HOME}/.kube/config"

# configure go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


# GOOGLE CLOUD SDK# The next line enables shell command completion for gcloud.
if [ -f '/Users/eduardosanchez/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/eduardosanchez/Downloads/google-cloud-sdk/completion.zsh.inc'; fi


# FNM that is the new NVM
eval "$(fnm env --use-on-cd)"
export PATH="/Users/eduardosanchez/.local/state/fnm_multishells/56576_1733171548825/bin":$PATH
export FNM_MULTISHELL_PATH="/Users/eduardosanchez/.local/state/fnm_multishells/56576_1733171548825"
export FNM_VERSION_FILE_STRATEGY="local"
export FNM_DIR="/Users/eduardosanchez/.local/share/fnm"
export FNM_LOGLEVEL="info"
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
export FNM_COREPACK_ENABLED="false"
export FNM_RESOLVE_ENGINES="true"
export FNM_ARCH="arm64"
rehash

# imagemagick export used for neovim image rendering
export DYLD_FALLBACK_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_FALLBACK_LIBRARY_PATH"

#FINAL SOURCE
source $ZSH/oh-my-zsh.sh

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/eduardosanchez/.lmstudio/bin"

. "$HOME/.local/bin/env"

# fnm
FNM_PATH="/Users/eduardosanchez/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/eduardosanchez/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/eduardosanchez/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# pnpm
export PNPM_HOME="/Users/eduardosanchez/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/eduardosanchez/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/eduardosanchez/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/eduardosanchez/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/eduardosanchez/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Override macos sqlite for load extension
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib"
export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include"

