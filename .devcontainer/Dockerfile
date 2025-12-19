FROM mcr.microsoft.com/devcontainers/java:17

# Install basic build tools and python (no heavy pip installs at build-time).
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    git \
    curl \
    build-essential \
    python3 \
    python3-venv \
    python3-pip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Prepare pip cache directory for the `vscode` user (mounted volume will override).
RUN mkdir -p /home/vscode/.cache/pip && chown -R 1000:1000 /home/vscode/.cache/pip

USER vscode
