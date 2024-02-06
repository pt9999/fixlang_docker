# based on https://github.com/dolph/docker-image-ubuntu-rust/blob/master/docker/Dockerfile
FROM ubuntu:jammy AS llvmenv_build

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

#---------------------------------------------------------------------------------
FROM ubuntu:jammy AS fix_build

USER root
ENV USER root

# Install package dependencies.
RUN apt-get update \
    && apt-get install -y \
    apt-utils \
    curl \
    git \
    gcc \
    make \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

ENV HOME "/root"
ENV PATH "$PATH:/root/.cargo/bin"

COPY --from=llvmenv_build $HOME/.local $HOME/.local
COPY --from=llvmenv_build $HOME/.config $HOME/.config
COPY --from=llvmenv_build $HOME/.cargo $HOME/.cargo
COPY --from=llvmenv_build $HOME/.rustup $HOME/.rustup

ENV LLVM_SYS_120_PREFIX "$HOME/.local/share/llvmenv/12.0.1"

RUN git clone https://github.com/tttmmmyyyy/fixlang.git

RUN apt-get update \
    && apt-get install -y \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

RUN cd fixlang && cargo install --locked --path .

#---------------------------------------------------------------------------------
FROM ubuntu:jammy AS fix

RUN apt-get update \
    && apt-get install -y \
        gcc make git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV HOME "/root"

COPY --from=fix_build $HOME/.cargo/bin/fix /usr/local/bin/fix

RUN chmod 0755 /usr/local/bin/fix

CMD [ "/bin/bash" ]

#---------------------------------------------------------------------------------
FROM fix AS fixlang_minilib

RUN git clone https://github.com/pt9999/fixlang_minilib.git

RUN cd fixlang_minilib && make test
