FROM ubuntu:latest
LABEL maintainer="Eduardo Bautista <eduardosanzb@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive
ARG USER_NAME="eduardosanzb"
ARG USER_PASSWORD="password"

ENV USER_NAME $USER_NAME
ENV USER_PASSWORD $USER_PASSWORD
ENV CONTAINER_IMAGE_VER=v1.0.0

RUN echo $USER_NAME
RUN echo $USER_PASSWORD
RUN echo $CONTAINER_IMAGE_VER

# install the tooks i wish to use
RUN apt-get update && \
  apt-get install -y sudo \
  vim \
  curl \
  git-core \
  gnupg \
  vim-gui-common \
  vim-runtime \
  locales \
  awscli \
  nodejs \
  zsh \
  wget \
  nano \
  unzip \
  npm \
  xclip \
  apt-transport-https \
  ca-certificates \ 
  software-properties-common \
  fonts-powerline \
  # set up locale
  && locale-gen en_US.UTF-8 \
  # add a user (--disabled-password: the user won't be able to use the account until the password is set)
  && adduser --quiet --disabled-password --shell /bin/zsh --home /home/$USER_NAME --gecos "User" $USER_NAME \
  # update the password
  && echo "${USER_NAME}:${USER_PASSWORD}" | chpasswd && usermod -aG sudo $USER_NAME



# Installing kubectl 
COPY --from=lachlanevenson/k8s-kubectl /usr/local/bin/kubectl /usr/local/bin/kubectl
# Installing eks
RUN curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp 
RUN mv /tmp/eksctl /usr/local/bin

# the user we're applying this too (otherwise it most likely install for root)
USER $USER_NAME
# terminal colors with xterm
ENV TERM xterm
# set the zsh theme
ENV ZSH_THEME pure

# run the installation script  
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

COPY gitconfig /home/$USER_NAME/.gitconfig
COPY .vimrc /home/$USER_NAME/.vimrc
COPY .ssh/* /home/$USER_NAME/.ssh
COPY aws /home/$USER_NAME/.aws
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN vim +PlugInstall +qall
RUN sudo curl -L https://github.com/hasura/graphql-engine/raw/master/cli/get.sh | INSTALL_PATH=/hasuracli bash



# start zsh
CMD [ "zsh" ]
