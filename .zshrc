export ZSH="$HOME/.oh-my-zsh"

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
autoload bashcompinit && bashcompinit

# AUTOCOMPLATION SETUP
source <(fzf --zsh)


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


# GOOGLE CLOUD SDK
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/eduardosanchez/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/eduardosanchez/Downloads/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
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

#FINAL SOURCE
source $ZSH/oh-my-zsh.sh
