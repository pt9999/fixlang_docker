REPO=pt9999
NAME=llvm
TAG=17.0.6-jammy

IMAGE=${REPO}/${NAME}:${TAG}

all: build

build:
#	docker build . -t ${IMAGE}
	time nice docker build . -t ${IMAGE} --progress plain 2>&1 | tee build.log

push:
	docker push ${IMAGE}
