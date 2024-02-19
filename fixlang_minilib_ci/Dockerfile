FROM ubuntu:jammy AS fixlang_minilib_ci

RUN apt-get update \
    && apt-get install -y \
        gcc make git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV HOME "/root"

COPY --from=pt9999/fixlang:latest /usr/local/bin/fix /usr/local/bin/fix
COPY --from=pt9999/fixlang:latest /usr/local/share/doc/fixlang/LICENSE /usr/local/share/doc/fixlang/LICENSE
COPY --from=pt9999/fixlang:latest /fixlang-revision /fixlang-revision

#RUN git clone https://github.com/pt9999/fixlang_minilib.git

#RUN cd fixlang_minilib && make bin/fixautolink

