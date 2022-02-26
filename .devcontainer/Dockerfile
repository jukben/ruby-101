ARG VARIANT=3-bullseye
FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-${VARIANT}

RUN mkdir -p /home/vscode/.ssh
RUN chown -R vscode:vscode /home/vscode/.ssh

COPY --chown=vscode:vscode ./ssh-config/key/ssh-docker /home/vscode/.ssh/ssh-docker
RUN chmod 400 /home/vscode/.ssh/ssh-docker

COPY --chown=vscode:vscode ./ssh-config/config ssh-config
RUN cat ssh-config >> /home/vscode/.ssh/config
