REPO=pt9999
NAME=fixlang
TAG=latest

IMAGE=${REPO}/${NAME}:${TAG}

all: build

build:
	docker build . -t ${IMAGE}

push:
	docker push ${IMAGE}
