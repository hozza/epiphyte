# epiphyte 🌱

 > ## **eh**·puh·fite *([pronunciation](https://duckduckgo.com/?q=epiphyte+pronounce&ia=definition))*
>
> Why "epiphyte"? According to [Wikipedia](https://en.wikipedia.org/wiki/Epiphyte), an epiphyte is a plant that grows on the surface of another plant. This sounds just like a development container on top of a host to me.
>
>*The [vanilla plant](https://en.wikipedia.org/wiki/Vanilla_planifolia) will sometimes grow as an epiphyte - perfect for software engineering on an immutable host like [Vanilla OS](https://vanillaos.org/).*

**A secure, simple and small ~160MB container for web development in php or nodejs.**


## What's in it?

 0. Base image is [Wolfi OS](https://edu.chainguard.dev/chainguard/chainguard-images/reference/wolfi-base/overview/) by [Chainguard](https://www.chainguard.dev/) (a small and more secure base image than [alpine](https://hub.docker.com/_/alpine/))
 1. `git`, `curl`, `openssh`, `rsync`
 2. `php`, `nodejs`*...more soon* 
 3. `php-curl`
 
 *(latest versions provided by Wolfi OS)*

## How to use?

Chainguard's wolfi-base image drops you into a bash shell with `apk` package manger just like the [`alpine:latest`](https://hub.docker.com/_/alpine) container image. 

You can run the epiphyte container by copying the `compose.yaml` from this repo into the root of your project and then running `podman-compose up` (you can also use `docker` and append `-d` to the command for detached mode).

### What's Podman?

[Podman](https://podman.io/) is an open-source and permissive licensed Docker CE alternative. It's mostly identical to docker. It can be bash aliased as it's a drop in replacement. *It also has some extra tricks like rootless containers and runs without a system daemon.*

Podman focuses on the OSI Container spec rather than Docker specific terminology e.g. `Dockerfile` is `Containerfile` and `docker-compose.yaml` is `podman-compose.yaml` or `compose.yaml` etc. 

## Tips!

1. Mod the `compose.yaml` to the specifics of your repo, per repo.
2. Add more packages to your container (ephemerally) the same as `alpine` OS e.g. `apk add python`.
3. Don't forget to use `podman-compose down` (or `docker compose down` *- notice the space instead of a hyphen*) when you're done using it!

### Using with VS Code

*I prefer running "compose up" manually and then attaching VS code to the container, rather than using the VS Code "Dev Container" plugin's `devcontainer.json` config file. I want a more portable dev env and the "dev container" spec is not well defined or documented just yet IMO.*

#### Launching the Dev Environment for VS Code

1. Copy the `./compose.yaml` into the root of your project.
2. Run this epiphyte container with `podman-compose up -d`. (or use `docker compose up -d`).
3. Use the ["Dev Container" (pka "Remote Containers") VS Code plugin](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) to **"Attach to Running Container"** via command menu `Ctrl+Shift+P`. This allows the "Dev Container" extension to install its dependencies to act as your VS Code environment.
4. **(Optional)** Some VS Code plugins need to run in your environment (now the epiphyte container) and not on your host. Install your plugins into the container by clicking the "Install in Container" button now present on the usual VS Code plugin tab.

By running the compose file from your projects root, it'll mount your project `.` at `/srv` in the container, open this location when you're attached in VS Code.

You can run any of your normal tools or commands like `npm start` via the integrated terminal (or omit the `-d` when composing to leave it's shell open). 

🚀