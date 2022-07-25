FROM ubuntu:latest
LABEL maintainer="Eduardo Bautista <eduardosanzb@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND $DEBIAN_FRONTEND

ARG USER_ID
ARG GROUP_ID

ARG USER_NAME eduardosanzb
ARG USER_PASSWORD password

ARG GIT_USER_NAME
ARG GIT_USER_EMAIL

ENV TERM xterm

ENV USER_ID $USER_ID
ENV USER_PASSWORD $USER_PASSWORD
ENV CONTAINER_IMAGE_VER=v1.0.0

# nvm environment variables
RUN mkdir /usr/local/nvm
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 17
ENV NVM_INSTALL_PATH $NVM_DIR/versions/node/v$NODE_VERSION

RUN echo $USER_ID
RUN echo $USER_PASSWORD
RUN echo $CONTAINER_IMAGE_VER

RUN apt-get update && \
    apt-get install -qq -y \
                software-properties-common && \
    add-apt-repository universe && \
    apt-get update && \
    apt-get upgrade -qq -y && \
    TZ=Europe/Berlin apt-get install -qq -y \
    locales \
    gcc \
    g++ \
    make \
    zsh \
    curl \
    wget \
    git \
    fd-find \
    tmux \
    zip \
    unzip \
    tzdata \
    python2 \
    python3 \
    python3-pip \
    python3-neovim \
    ruby-full \
    postgresql-client \
    sudo


# install the tooks i wish to use
#             # set up locale
#             && locale-gen en_US.UTF-8 \
#             # add a user (--disabled-password: the user won't be able to use the account until the password is set)
#             && adduser --quiet --disabled-password --shell /bin/zsh --home /home/$USER_ID --gecos "User" $USER_ID \
#             # update the password
#            && echo "${USER_ID}:${USER_PASSWORD}" | chpasswd && usermod -aG sudo $USER_ID

# Set the local
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF8
ENV LANGUAGE en_US:en_US
ENV LC_ALL en_US.UTF-8

# golang install
ARG GO_VER 1.18.4
ENV GO_VER 1.18.4
WORKDIR /usr/local
RUN curl -fLO https://golang.org/dl/go${GO_VER}.linux-arm64.tar.gz && \
  tar -xvf go${GO_VER}.linux-arm64.tar.gz && \
  rm go${GO_VER}.linux-arm64.tar.gz

# install latest neovim
WORKDIR /usr/tmp
run curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
run chmod u+x nvim.appimage
run mv nvim.appimage /usr/local/bin/nvim
# RUN curl -fLO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb
# RUN apt -qq -y install ./nvim-linux64.deb

# neovim helpers
RUN pip3 install --upgrade pynvim && \
  gem install neovim


# set up user and environment
RUN addgroup --gid $GROUP_ID $USER_NAME
RUN adduser --quiet  --disabled-password --shell /bin/zsh --gecos '' --uid $USER_ID --gid $GROUP_ID $USER_NAME && \
  echo "${USER_NAME}:${USER_PASSWORD}" | chpasswd && usermod -aG sudo $USER_NAME

RUN chsh -s /user/bin/zsh $USER_NAME

USER $USER_NAME
ENV HOME /home/$USER_NAME
ENV PATH "/usr/local/go/bin:$PATH"

WORKDIR "$HOME"

# golang based utils and user environment
ENV GOPATH "$HOME/go"
ENV PATH "$GOPATH:$PATH"
ENV GOBIN "$GOPATH/bin"
RUN go install golang.org/x/tools/gopls@latest


# link python3 to default
# RUN ln -s /usr/bin/python3 /usr/bin/python

################################
# setting default language
################################


# ENV PATH=/root/.local/bin:/home/$USER_ID/.local/bin:$PATH
################################
# Installing AWS related
################################
# RUN pip3 --no-cache-dir install --upgrade --user awscli
# RUN pip3 install awsume

################################
# Installing kubectl
################################
# COPY --from=lachlanevenson/k8s-kubectl /usr/local/bin/kubectl /usr/local/bin/kubectl
################################
# Install eks
################################
# RUN curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
# RUN mv /tmp/eksctl /usr/local/bin

################################
# Javascript stuff
################################
# RUN npm install -g yarn

################################
# Install nvm
################################
# RUN rm /bin/sh && ln -s /bin/bash /bin/sh
# RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

################################
# Install node and npm
################################
# RUN .  $NVM_DIR/nvm.sh \
#   && nvm install $NODE_VERSION \
#   && nvm alias default $NODE_VERSION \
#   && nvm use default \
#   && source /usr/local/nvm/nvm.sh
#
# ENV NODE_PATH $NVM_INSTALL_PATH/lib/node_modules
# ENV PATH $NVM_INSTALL_PATH/bin:$PATH


################################
# Install Hasura
################################
# RUN sudo curl -L https://github.com/hasura/graphql-engine/raw/master/cli/get.sh | INSTALL_PATH=/hasuracli bash

################################
# Install Terraform
################################
# ARG TERRAFORM_VERSION=0.13.5
# RUN wget --progress=dot:mega https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
# RUN \
#   # Unzip
#   unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
#   # Move to local bin
#   mv terraform /usr/local/bin/ && \
#   # Make it executable
#   chmod +x /usr/local/bin/terraform && \
#   # Check that it's installed
#   terraform --version

# install Oh-My-ZSH
ENV ZSH_THEME refined
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

# COPY gitconfig /home/$USER_ID/.gitconfig
# COPY vimrc /home/$USER_ID/.vimrc
# COPY ssh /home/$USER_ID/.ssh
# COPY zshrc /home/$USER_ID/.zshrc
# COPY aws /home/$USER_ID/.aws


COPY --chown=$USER_NAME:user dotfiles .


# set git config options for user
RUN if [ ! -z "$GIT_USER_NAME" ] && [ ! -z "$GIT_USER_EMAIL" ]; then \
    git config --global user.name "$GIT_USER_NAME"; \
    git config --global user.email "$GIT_USER_EMAIL"; \
  fi



# install nvm/Node.js
ARG NODE_VER "18.16.0"
ENV NODE_VER $NODE_VER
ENV PROFILE "$HOME/.zshrc"
ENV NVM_DIR "$HOME/.nvm"
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash && \
  . "$NVM_DIR/nvm.sh" && \
  nvm install "$NODE_VER" && \
  nvm use node && \
  npm install -g neovim
ENV PATH "$HOME/.nvm/versions/node/v$NODE_VER/bin:$PATH"

ENV PATH=/root/.local/bin:/home/$USER_ID/.local/bin:/usr/local/bin:$PATH


# start zsh
WORKDIR /home/$USER_NAME
# CMD [ "zsh" ]
