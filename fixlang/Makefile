REPO=pt9999
NAME=fixlang
TAG=latest

IMAGE=${REPO}/${NAME}:${TAG}

all: build

build:
	curl https://api.github.com/repos/tttmmmyyyy/fixlang/branches/main | jq -r '.commit.sha' > commit-sha
# docker build . -t ${IMAGE}
	time nice docker build . -t ${IMAGE} --progress plain 2>&1 | tee build.log

push:
	docker push ${IMAGE}
