FROM pt9999/fixlang:latest

RUN apt-get update \
    && apt-get install -y \
        gcc make git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/pt9999/fixlang_minilib.git

RUN cd fixlang_minilib && make bin/fixautolink

