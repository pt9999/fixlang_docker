FROM pt9999/llvmenv:12.0.1-jammy AS fix_build

RUN git clone https://github.com/tttmmmyyyy/fixlang.git

RUN cd fixlang && cargo install --locked --path .

#---------------------------------------------------------------------------------
FROM ubuntu:jammy AS fixlang

RUN apt-get update \
    && apt-get install -y \
        gcc make git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV HOME "/root"

COPY --from=fix_build $HOME/.cargo/bin/fix /usr/local/bin/fix

RUN chmod 0755 /usr/local/bin/fix

CMD [ "/bin/bash" ]
