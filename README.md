# SpringBoot_AI_2
## Codespaces / Devcontainer persistence

- **What is persisted:** apt package cache, Python pip cache, npm cache, and Maven (`.m2`) are mounted to named Docker volumes so installs are faster and survive container rebuilds in Codespaces.
- **Files added:** `.devcontainer/devcontainer.json`, `.devcontainer/Dockerfile`, and `.devcontainer/install-packages.sh`.
- **How it works:** the devcontainer mounts these named volumes: `codespaces-apt-cache`, `codespaces-pip-cache`, `codespaces-npm-cache`, `codespaces-m2`.
- **Open in Codespaces:** create or open a Codespace for this repo and choose "Rebuild Container" (or use the Codespaces UI). The `postCreateCommand` will run and use the caches.
- **Clear caches (local Docker only):**

```bash
docker volume rm codespaces-apt-cache codespaces-pip-cache codespaces-npm-cache codespaces-m2
```

If you want a different persistence strategy (e.g., bind-mount to a repo folder or cloud-backed cache), tell me which you'd prefer and I'll update the devcontainer configuration.
SpringBoot AI
