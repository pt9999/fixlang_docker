FROM ubuntu:jammy AS fixlang_minilib_ci

RUN apt-get update \
    && apt-get install -y \
        gcc make git \
        libpng-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# NOTE: libpng-dev is included for testing purpose

ENV HOME "/root"

# TODO: should the tag of two images be equal? : `pt9999/fixlang:{tag}`, `pt9999/fixlang_minilib_ci:{tag}`
COPY --from=pt9999/fixlang:latest /usr/local/bin/fix /usr/local/bin/fix
COPY --from=pt9999/fixlang:latest /usr/local/share/doc/fixlang/LICENSE /usr/local/share/doc/fixlang/LICENSE
COPY --from=pt9999/fixlang:latest /fixlang-revision /fixlang-revision

#RUN git clone https://github.com/pt9999/fixlang_minilib.git

#RUN cd fixlang_minilib && make bin/fixautolink

