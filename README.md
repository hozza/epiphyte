# epiphyte 🌱

 > ## **eh**·puh·fite *([pronunciation](https://duckduckgo.com/?q=epiphyte+pronounce&ia=definition))*
>
> Why "epiphyte"? According to [Wikipedia](https://en.wikipedia.org/wiki/Epiphyte), an epiphyte is a plant that grows on the surface of another plant. This sounds just like a development container on top of a host to me.
>
>*The [vanilla plant](https://en.wikipedia.org/wiki/Vanilla_planifolia) will sometimes grow as an epiphyte - perfect for software engineering on an immutable [Vanilla OS](https://vanillaos.org/).*

**A secure, simple and small 153MB container for web development in php or nodejs.**


## What's in it?

 0. [Wolfi OS](https://edu.chainguard.dev/chainguard/chainguard-images/reference/wolfi-base/overview/) by [Chainguard](https://www.chainguard.dev/) (a small and more secure base image than [alpine](https://hub.docker.com/_/alpine/))
 1. `git`, `curl`, `openssh`, `rsync`
 2. `php`, `nodejs`*...more soon* (latest versions provided by Wolfi OS)

## How to use?

Chainguard's wolfi-base image drops you into a bash shell with `apk` package manger just like `alpine:latest`. 

You can run the container using by cloning this repo and running `podman-compose up` (you can also use `docker` and append `-d` to the command for detached mode).

### VS Code Dev Container

*I prefer using something like "compose up" manually and then attaching VS code to the container, rather than using the VS Code "Dev Container" plugin's `devcontainer.json` config file. I want a more portable dev env and the "dev container" spec is not well defined or documented just yet.*

#### Launching the Dev Environment

1. Copy `./Containerfile` and `./compose.yaml` into the root of your project.
2. Run this epiphyte container with `podman-compose up -d`. (or use `docker compose up -d`).
3. Use the ["Dev Container" (pka "Remote Containers") VS Code plugin](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) to **"Attach to Running Container"** via command menu `Ctrl+Shift+P`. This allows the "Dev Container" extension to install its dependencies to act as your VS Code environment.
4. (Optional) Some VS Code plugins need to run in your environment (now the epiphyte container) and not on your host. Install your plugins into the container by clicking the "Install in Container" button now present on the normal VS Code plugin tab.

By running the compose file from your projects root, it'll mount your project `.` at `/srv` in the container, open this location when you're in. 

You can run any of your normal tools or commands like `npm start` via the integrated terminal (or omit the `-d` when composing to leave it's shell open). 🚀