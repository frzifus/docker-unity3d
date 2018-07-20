VERSION=Unity-2018.2.0f2
WORKDIR=$(shell pwd)
IMAGE=unity3d
STORAGE=storage
USER=user
VOLUME=-v /tmp/.X11-unix:/tmp/.X11-unix -v ${WORKDIR}/${STORAGE}:/home/${USER}/storage
SHARE=-e DISPLAY=${DISPLAY}
CONTAINER=unity3d

all:
	@echo "Version: ${VERSION}"
	@echo "make build:   creates a docker image (${IMAGE})"
	@echo "make install: stars UnitySetup"
	@echo "make run:     starts ${CONTAINER}"
	@echo "make shell:   opens a shell in the container"

build:
	docker build -t ${IMAGE} .

install: clean
	@mkdir -p ${STORAGE}
	@docker run --name ${CONTAINER} ${SHARE} ${VOLUME} ${IMAGE}

shell:
	@mkdir -p ${STORAGE}
	@docker exec -it ${SHARE} unity3d /bin/bash

install-vsCode:
	@docker exec -it ${CONTAINER} /bin/bash -c "wget "https://go.microsoft.com/fwlink/?LinkID=760868" -O vscode.deb; dpkg -i vscode.deb;"

run:
	@docker start ${CONTAINER}

clean:
	@docker rm ${CONTAINER} || true

dist-clean: clean
	@docker rmi ${IMAGE} || true
