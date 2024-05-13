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
# make an alias to opa file to be a command
alias opa="~/opa"
autoload bashcompinit && bashcompinit


#deno installations
export DENO_INSTALL_ROOT="${HOME}/.deno"
mkdir -p "${DENO_INSTALL_ROOT}"
export PATH="${HOME}/.deno/bin:$PATH"


export PATH="/opt/homebrew/opt/mongodb-community@4.4/bin:$PATH"
export NPM_GITHUB_TOKEN=<>
export REDIS_IN_MEMORY_VERSION=6.0.10


# https://confluence.unity3d.com/pages/viewpage.action?spaceKey=PRE&title=Steps+to+add+JFrog+Artifactory+to+your+workflow#StepstoaddJFrogArtifactorytoyourworkflow-3.)CanyouuseJFroginyourdevelopmentworkflow?(HowtointeractlocallywithJFrog)
#`~/.profile` must be sourced by the shell for this to work.
export JFROG_ARTIFACTORY_READ_USER=eduardo.bautista@unity3d.com
export JFROG_ARTIFACTORY_READ_TOKEN=<>

# To npm install work when doing docker build locally
echo export JFROG_ARTIFACTORY_READ_USER=${JFROG_ARTIFACTORY_READ_USER} >> ~/.profile
echo export JFROG_ARTIFACTORY_READ_TOKEN=${JFROG_ARTIFACTORY_READ_TOKEN} >> ~/.profile

ZSH_COMMAND_TIME_MIN_SECONDS=3
ZSH_COMMAND_TIME_MSG="Execution time: %s sec"
ZSH_COMMAND_TIME_COLOR="cyan"
ZSH_COMMAND_TIME_EXCLUDE=(vim mcedit)

export KUBECONFIG="${HOME}/.kube/config"

# configure go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


# Unity vault config
export VAULT_ADDR='https://vault.corp.unity3d.com'


#FINAL SOURCE
source $ZSH/oh-my-zsh.sh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
# The next line enables shell command completion for gcloud.
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"


