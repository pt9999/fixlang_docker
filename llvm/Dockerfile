################################################################################
# Dockerfile for llvm:17.0.6
#
# based on https://github.com/dolph/docker-image-ubuntu-rust/blob/master/docker/Dockerfile
################################################################################

#----------------------------------------------
# Create a docker image for llvm:17.0.6
#----------------------------------------------
FROM ubuntu:jammy AS llvm

USER root
ENV USER=root \
    HOME="/root" \
    PATH="$PATH:/root/.cargo/bin"

# Install package dependencies.
RUN apt-get update \
    && apt-get install -y \
    apt-utils \
    curl \
    git \
    gcc \
    make \
    build-essential \
    libffi-dev \
    libzstd-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Rust
RUN curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf > /tmp/rustup-init.sh \
    && chmod +x /tmp/rustup-init.sh \
    && sh /tmp/rustup-init.sh -y \
    && rm -rf /tmp/rustup-init.sh

RUN mkdir -p "$HOME/.local/share/llvm/" \
    && cd "$HOME/.local/share/llvm/" \
    && curl -L https://github.com/llvm/llvm-project/releases/download/llvmorg-17.0.6/clang+llvm-17.0.6-x86_64-linux-gnu-ubuntu-22.04.tar.xz -sSf \
       | tar Jxf - \
    && ln -s clang+llvm-17.0.6-x86_64-linux-gnu-ubuntu-22.04 17.0.6

ENV LLVM_SYS_170_PREFIX="$HOME/.local/share/llvm/17.0.6"

RUN ls -l $LLVM_SYS_170_PREFIX


