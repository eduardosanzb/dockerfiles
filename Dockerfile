FROM ubuntu:latest
LABEL maintainer="Eduardo Bautista <eduardosanzb@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive
ARG USER_NAME="eduardosanzb"
ARG USER_PASSWORD="password"

ARG TERRAFORM_VERSION=0.13.5


ENV USER_NAME $USER_NAME
ENV USER_PASSWORD $USER_PASSWORD
ENV CONTAINER_IMAGE_VER=v1.0.0

# nvm environment variables
RUN mkdir /usr/local/nvm
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION node
ENV NVM_INSTALL_PATH $NVM_DIR/versions/node/v$NODE_VERSION


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
  screen \
  ca-certificates \ 
  software-properties-common \
  fonts-powerline \
  python3-pip \
  python3.8-venv \
  # set up locale
  && locale-gen en_US.UTF-8 \
  # add a user (--disabled-password: the user won't be able to use the account until the password is set)
  && adduser --quiet --disabled-password --shell /bin/zsh --home /home/$USER_NAME --gecos "User" $USER_NAME \
  # update the password
  && echo "${USER_NAME}:${USER_PASSWORD}" | chpasswd && usermod -aG sudo $USER_NAME

################################
# setting default language
################################
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# RUN pip install pipx
 ENV PATH=/root/.local/bin:$PATH

# RUN pipx install awsume \
#      && pipx inject awsume awsume-console-plugin \
#      && awsume-configure --shell zsh --autocomplete-file ~/.zshrc --alias-file ~/.zshrc

RUN sudo pip install awsume \
     &&  awsume-configure --shell zsh --autocomplete-file ~/.zshrc --alias-file ~/.zshrc

COPY --from=lachlanevenson/k8s-kubectl /usr/local/bin/kubectl /usr/local/bin/kubectl

################################
# Install eks
################################
RUN curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp 
RUN mv /tmp/eksctl /usr/local/bin

################################
# Javascript stuff
################################
RUN npm install -g yarn

################################
# Install nvm
################################
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 

################################
# Install node and npm
################################
RUN .  $NVM_DIR/nvm.sh \
   && nvm install $NODE_VERSION \
   && nvm alias default $NODE_VERSION \
   && nvm use default

ENV NODE_PATH $NVM_INSTALL_PATH/lib/node_modules
ENV PATH $NVM_INSTALL_PATH/bin:$PATH


################################
# Install Hasura
################################
RUN sudo curl -L https://github.com/hasura/graphql-engine/raw/master/cli/get.sh | INSTALL_PATH=/hasuracli bash

################################
# Install Terraform
################################
RUN wget --progress=dot:mega https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN \
	# Unzip
	unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
	# Move to local bin
	mv terraform /usr/local/bin/ && \
	# Make it executable
	chmod +x /usr/local/bin/terraform && \
	# Check that it's installed
	terraform --version


################################
# Setting up user
################################
USER $USER_NAME
# terminal colors with xterm
ENV TERM xterm
# set the zsh theme
ENV ZSH_THEME refined

# run the installation script  for zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

COPY gitconfig /home/$USER_NAME/.gitconfig
COPY vimrc /home/$USER_NAME/.vimrc
COPY ssh /home/$USER_NAME/.ssh
# COPY zshrc /home/$USER_NAME/.zshrc
COPY aws /home/$USER_NAME/.aws

# install vim plugins
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN vim +PlugInstall +qall


# start zsh
WORKDIR /home/$USER_NAME
CMD [ "zsh" ]
