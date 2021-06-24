# VARS
COMMIT_ID = $(shell git rev-parse --short HEAD)
PROJECT_NAME = develop
DOCKER_REPO = district0x
DEV_IMAGE = template-dev:local
BUILD_ENV = dev
SHELL=bash
DOCKER_VOL_PARAMS = -v ${PWD}:/build -v ${PROJECT_NAME}_vol_target:/build/target -v ${PROJECT_NAME}_vol_m2_cache:/root/.m2 -v ${PROJECT_NAME}_vol_node_modules:/build/node_modules --workdir /build
DOCKER_NET_PARAMS = --network=${PROJECT_NAME}_dev_network
.PHONY: help

# preconfig [build dev, registry creds, clean-volumes, create volumes]
# docker builds [dev, dev-ui, dev-server, prod-ui, prod-server, ]
# docker start containers and attach to shell []
# docker exec - runs a task and exit

# HELP
help: ## Print help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# DOCKER BUILDS

# DEV image
dev-image: ## Builds dev image
	DOCKER_BUILDKIT=1 BUILD_ENV=${BUILD_ENV} DOCKER_REPO=${DOCKER_REPO} COMMIT_ID=${COMMIT_ID} docker build -t ${DEV_IMAGE} . -f docker-builds/base/Dockerfile

dev-image-no-cache: ## Builds dev image
	DOCKER_BUILDKIT=1 BUILD_ENV=${BUILD_ENV} DOCKER_REPO=${DOCKER_REPO} COMMIT_ID=${COMMIT_ID} docker build -t ${DEV_IMAGE} . -f docker-builds/base/Dockerfile --no-cache --pull

# All images
build-images: ## Build all containers in docker-compose file
	DOCKER_BUILDKIT=1 BUILD_ENV=${BUILD_ENV} DOCKER_REPO=${DOCKER_REPO} docker-compose -p ${PROJECT_NAME} build --parallel

build-images-no-cache: # Build base docker image with node11.14, yarn, clojure, lein, truffle
	DOCKER_BUILDKIT=1 BUILD_ENV=${BUILD_ENV} DOCKER_REPO=${DOCKER_REPO} docker-compose -p ${PROJECT_NAME} build --parallel --pull --no-cache

# RUN CONTAINERS
init: ## Create docker networks, volumes and build containers for this project
	DOCKER_REPO=${DOCKER_REPO} docker-compose -p ${PROJECT_NAME} up --no-start --no-build

start-containers: dev-image ## Build and start containers ((ipfs, ganache, dev container)
	docker-compose -p ${PROJECT_NAME} up -d

run-dev-shell: ## Start container in interactive mode
	docker run -ti --rm --entrypoint="" ${DOCKER_NET_PARAMS} ${DOCKER_VOL_PARAMS} ${DEV_IMAGE} bash

check-containers: ## Show docker-compose ps for given project
	docker-compose -p ${PROJECT_NAME} ps

clear-all: ## Remove containers, networks and volumes
	DOCKER_BUILDKIT=1 BUILD_ENV=${BUILD_ENV} DOCKER_REPO=${DOCKER_REPO} docker-compose -p ${PROJECT_NAME} down --remove-orphans --volumes

# MISC
deps: dev-image ## Install/update deps
	docker run -t --rm ${DOCKER_NET_PARAMS} ${DOCKER_VOL_PARAMS} ${DEV_IMAGE} bash -c "yarn deps"

lint: dev-image deps  ## mount code inside dev container and lint
	docker run -t --rm ${DOCKER_NET_PARAMS} ${DOCKER_VOL_PARAMS} ${DEV_IMAGE} bash -c "yarn lint"

# SHORTCUTS
build: build-images ## Build all containers (alias for docker-build)
up: start-containers ## Start dev environment (alias for start-containers)
rm: clear-all ## Remove containers, networks and volumes (alias for clear-all)
ps: check-containers ## Show docker-compose ps for given project (alias for check-containers)
exec: run-dev-shell ## Show docker-compose ps for given project (alias for check-containers)
