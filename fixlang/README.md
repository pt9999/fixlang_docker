# Overview

Unofficial Docker image for [FixLang](https://github.com/tttmmmyyyy/fixlang).

# Usage

For example, if a file named `test.fix` exists in the current directory,
you can run `test.fix` with the command line below.

```
$ docker run --rm -it -v .:/work -w /work pt9999/fixlang fix run -f test.fix
```


The meaning of the above command line is as follows.
- `docker run` means to create and run a container from a docker image.
- The `--rm` option means to automatically remove the container.
- The `-it` option means to run the container under a tty in interactive mode.
- The `-v .:/work` option means to mount the current directory to the `/work` directory inside the container.
- The `-w /work` option sets the current directory to the `/work` directory when entering the container.
- `pt9999/fixlang` is the name of the docker image.
- `fix run -f` means to interpret and execute the file specified by the fix command.

It may be useful to set a bash alias as shown below.
```
$ alias fix='docker run --rm -it -v .:/work -w /work pt9999/fixlang fix'
$ fix run -f test.fix
```

# Dockerfile

Source code of Dockerfile is [here](https://github.com/pt9999/fixlang_docker/blob/main/fixlang/Dockerfile).

