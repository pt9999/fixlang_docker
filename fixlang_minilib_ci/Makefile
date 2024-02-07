REPO=pt9999
NAME=fixlang_minilib_ci
TAG=latest

IMAGE=${REPO}/${NAME}:${TAG}

all: build

build:
	docker build . -t ${IMAGE}

push:
	docker push ${IMAGE}
