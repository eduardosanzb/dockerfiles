export ZSH="/home/eduardosanzb/.oh-my-zsh"
export LANG=en_US.UTF-8

ZSH_THEME="pure"

CASE_SENSITIVE="true"


export UPDATE_ZSH_DAYS=13

DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
  git,
  docker-compose,
  git-flow-completion,
  git-flow,
  zsh-autosuggestions,
  osx,
  history,
  lol,
  npm,
  sudo,
  complwtation
)

source $ZSH/oh-my-zsh.sh

alias tmux="TERM=screen-256color-bce tmux"
alias dco="docker-compose"
alias tf="terraform"
alias gitclean="git branch | grep -v "master" | xargs git branch -D "
