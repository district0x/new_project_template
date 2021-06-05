<div align="left">
    <a href="https://discord.com/invite/sS2AWYm"><img alt="District0x Discord server" src="https://img.shields.io/discord/356854079022039062?label=district0x&logo=discord"></a>
    <a href="LICENSE"><img alt="LICENSE" src="https://img.shields.io/github/license/district0x/new_project_template"></a>
    <a href="http://makeapullrequest.com"><img alt="pull requests welcome" src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat"></a></p>
</div>

# District0x project template

This repository contains files, configs, and scripts to quickly get started with development of [District0x](https://district0x.io) projects. To start a new project simply use this template repo as shown in [this document](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/creating-a-repository-from-a-template)

# development

This is an open-source project and contributions, be it a new issue or pull request, are always welcome. You can find some good advice on how to get started on [github's guide](https://github.com/github/docs/blob/main/CONTRIBUTING.md)

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

There are several CI jobs build with Github Actions, that perform various checks for code in the repository. Job files live under `.github/workflows` folder.

## Build and run locally

To facilitate development this repository features [Makefile](Makefile) that helps to automate lots of tasks. To list available commands simply run `make help`. Here's a good tutorial on makefiles https://makefiletutorial.com/.
There's also `docker-compose.yml` file that ensures necessary services, network and volumes are up and running locally. Please note that for different projects both makefiles and ci jobs may require modifications.
