################################################################################
# Dockerfile for FixLang
################################################################################

#------------------------------------
# Build fixlang
#------------------------------------

FROM pt9999/llvmenv:12.0.1-jammy AS fix_build

RUN git clone https://github.com/tttmmmyyyy/fixlang.git

RUN cd fixlang && cargo install --locked --path .

#------------------------------------
# Create a docker image for fixlang 
#------------------------------------
FROM ubuntu:jammy AS fixlang

# gcc is required
RUN apt-get update \
    && apt-get install -y \
        gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV HOME "/root"

COPY --from=fix_build $HOME/.cargo/bin/fix /usr/local/bin/fix
COPY --from=fix_build /fixlang/LICENSE /usr/local/share/doc/fixlang/LICENSE

RUN chmod 0755 /usr/local/bin/fix

CMD [ "/bin/bash" ]
