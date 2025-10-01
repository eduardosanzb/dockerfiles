FROM ubuntu:latest
LABEL maintainer="Eduardo Bautista <eduardosanzb@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive
ARG USER_NAME="eduardosanzb"
# WARNING: Default password for development only
# Override this value when building: --build-arg USER_PASSWORD=your_secure_password
ARG USER_PASSWORD="password"


ENV USER_NAME $USER_NAME
ENV USER_PASSWORD $USER_PASSWORD
ENV CONTAINER_IMAGE_VER=v1.0.0

