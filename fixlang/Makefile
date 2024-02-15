REPO=pt9999
NAME=fixlang
TAG=latest

IMAGE=${REPO}/${NAME}:${TAG}

all: build

build:
	curl https://api.github.com/repos/tttmmmyyyy/fixlang/branches/main | jq -r '.commit.sha' > commit-sha
	docker build . -t ${IMAGE}

push:
	docker push ${IMAGE}
