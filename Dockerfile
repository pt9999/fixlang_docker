# based on https://github.com/dolph/docker-image-ubuntu-rust/blob/master/docker/Dockerfile
FROM ubuntu:jammy AS llvmenv-build

USER root
ENV USER root

# Install package dependencies.
RUN apt-get update \
    && apt-get install -y \
    apt-utils \
    curl \
    git \
    gcc \
    g++ \
    make \
    cmake \
    build-essential \
    libssl-dev \
    pkg-config \
    python3-distutils \
    && rm -rf /var/lib/apt/lists/*

# Install Rust
RUN curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf > /tmp/rustup-init.sh \
    && chmod +x /tmp/rustup-init.sh \
    && sh /tmp/rustup-init.sh -y \
    && rm -rf /tmp/rustup-init.sh

ENV HOME "/root"
ENV PATH "$PATH:/root/.cargo/bin"

# Avoid spurious network error
# https://qiita.com/n3_x/items/cca600dff7603f0b1f00
RUN /usr/bin/echo -e "[net]\ngit-fetch-with-cli = true\n" >> ~/.cargo/config

RUN cargo install llvmenv --verbose

RUN llvmenv init
RUN llvmenv entries
RUN llvmenv build-entry 12.0.1 -j 3 || true

# https://github.com/llvmenv/llvmenv/issues/115
RUN ln -s "$HOME/.cache/llvmenv/12.0.1/projects/libunwind/include/mach-o" \
          "$HOME/.cache/llvmenv/12.0.1/tools/lld/MachO/mach-o"

RUN llvmenv build-entry 12.0.1 -j 3

