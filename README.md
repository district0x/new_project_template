<div align="left">
    <a href="https://discord.com/invite/sS2AWYm"><img alt="District0x Discord server" src="https://img.shields.io/discord/356854079022039062?label=district0x&logo=discord"></a>
    <a href="LICENSE"><img alt="LICENSE" src="https://img.shields.io/github/license/district0x/new_project_template"></a>
    <a href="http://makeapullrequest.com"><img alt="pull requests welcome" src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat"></a></p>
</div>

# District0x project template

This repository contains files, configs, and scripts to quickly get started with development of [District0x](https://district0x.io) projects. To start a new project simply use this template repo as shown in [this document](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/creating-a-repository-from-a-template)

# Development

This is an open-source project and contributions, be it a new issue or pull request, are always welcome. You can find some good advice on how to get started on [github's guide](https://github.com/github/docs/blob/main/CONTRIBUTING.md)

## NodeJS and Clojure

This project has an example Dockerfile that features NodeJS 14, yarn and truffle. There's also a commented out part that handles Clojure and Lein installation. To add clojure support uncomment lines 8 to 14 in `docker-builds/base/Dockerfile`.

## Technical stack

District0x projects usually rely on the following tech

-   [0x Protocol](https://blog.0xproject.com/a-beginners-guide-to-0x-81d30298a5e0)
-   [Clojurescript](https://clojurescript.org/)
-   [d0x-INFRA](https://github.com/district0x/d0x-INFRA)
-   [Docker-compose](https://docs.docker.com/compose/reference/)
-   [Docker](https://docs.docker.com/get-started/)
-   [Ganache-cli](https://github.com/trufflesuite/ganache-cli)
-   [Github actions](https://docs.github.com/en/actions)
-   [GraphQL](https://graphql.org/)
-   [IPFS](https://docs.ipfs.io/)
-   [Nodejs](https://nodejs.org/en/about/)
-   [Proxy Contracts in Solidity](https://blog.zeppelin.solutions/proxy-libraries-in-solidity-79fbe4b970fd)
-   [re-mount](https://github.com/district0x/d0x-INFRA/blob/master/re-mount.md)
-   [Solidity](http://solidity.readthedocs.io/en/develop/)
-   [Token Curated Registries (TCR)](https://medium.com/@ilovebagels/token-curated-registries-1-0-61a232f8dac7)

# Github Actions CI

There are several CI jobs build with Github Actions, that perform various checks for code in the repository. Job files live under `.github/workflows` folder. The CI checks for this repository include:

- Dockerfile linting with Hadolint
- Docker images build for ui and server with qa and prod settings
- Docker images and vulnerability scannings with CodeQL and Trivy


## Using Makefile and Docker-compose

To facilitate development this repository features [Makefile](Makefile) that helps to automate lots of tasks. To list available commands simply run `make help`. Here's a good tutorial on makefiles https://makefiletutorial.com/. There's also a `docker-compose.yml` file that ensures necessary services, network and volumes are up and running locally. Please note that for different projects both makefiles and ci jobs may require modifications.

Try running `make` to see the list of available commands.
For example to build docker images for one of the given environments, simply run `make build-images`.

Try `make up` or `make start-containers` to init and start containers for this project. This includes the creation of docker volumes, networks, building docker images, and starting them. To interact with docker-compose directly always add `-p develop` or set proper PROJECT_NAME. It should be the same as in the Makefile vars section. This project name will serve as sort of a namespace for docker-compose and it will prefix all the resource names that it manages:

```sh
docker-compose -p develop ps
```

It is also possible to build and start a dev image that contains all the necessary tools to build, test, and run the project: `make build-dev-image` and then `make exec`.
