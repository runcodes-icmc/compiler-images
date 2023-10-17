
IMAGE_PREFIX ?= ghcr.io/runcodes-icmc/compiler-images

build-base:
	docker build -t ${IMAGE_PREFIX}-base:latest -f ./base/Dockerfile ./base --no-cache

build-%:
	docker build -t ${IMAGE_PREFIX}-$*:latest -f ./$*/Dockerfile ./$* --no-cache

build-cached-%:
	docker build -t ${IMAGE_PREFIX}-$*:latest -f ./$*/Dockerfile ./$*

build-cached-octave:
	docker build -t ${IMAGE_PREFIX}-octave:latest -f ./octave/Dockerfile ./octave --build-arg="MAKE_ARGS=-j24"

all: build-base build-c build-cpp build-fortran build-go build-haskell build-java build-pascal build-portugol build-python build-r build-rust build-octave build-dotnet

.PHONY: all
