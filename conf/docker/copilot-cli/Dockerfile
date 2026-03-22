# Step : Install base image
FROM ubuntu:24.04

## Update linux and tools
RUN apt update -y
RUN apt install -y \
  curl

# Step : Install Github CLI
RUN mkdir -p -m 755 /etc/apt/keyrings && \
  curl https://cli.github.com/packages/githubcli-archive-keyring.gpg -o /etc/apt/keyrings/githubcli-archive-keyring.gpg && \
  chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
RUN mkdir -p -m 755 /etc/apt/sources.list.d && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
RUN apt update && apt install -y gh

# Step : Install Github Copilot CLI
RUN curl -fsSL https://gh.io/copilot-install | bash

## Setting container startup
ADD ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +rx /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
