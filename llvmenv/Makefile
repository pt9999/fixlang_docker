REPO=pt9999
NAME=llvmenv
TAG=12.0.1-jammy

IMAGE=${REPO}/${NAME}:${TAG}

all: build

build:
	docker build . -t ${IMAGE}
#	time nice docker build . -t pt9999/llvmenv:12.0.1-jammy --progress plain 2>&1 | tee build.log

push:
	docker push ${IMAGE}
