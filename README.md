### Set-up instructions on macOS

1. Install [devenv](https://devenv.sh/getting-started/): devenv is needed to create a local nix environment with node and pnpm to install required dev dependencies locally. This allows in particular for autocomplete to work in vscode.

2. Install [Docker Desktop](https://docs.docker.com/desktop/install/mac-install/)

3. Run the dev environment for the first time by executing:
```zsh
./dev.sh
```

4. The dev page should be already accessible through http://localhost:3000

5. Once Docker has created the Caddy container, we can install its local certificate by executing
```zsh
sudo sh ./install-cert-macos.sh
```

6. Update the host file: Add the line
```
127.0.0.1   local.rbadal.com
```

7. Then flush the cache:
```zsh
dscacheutil -flushcache
```

8. The dev page should be now also accessible through https://local.rbadal.com

### Set-up instructions on Fedora

1. Install [devenv](https://devenv.sh/getting-started/): devenv is needed to create a local nix environment with node and pnpm to install required dev dependencies locally. This allows in particular for autocomplete to work in vscode.

2. Set up [Docker's package repository](https://docs.docker.com/engine/install/fedora/#set-up-the-repository):
```zsh
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
```

3. In order to remove older docker or docker-engine versions run (not required on a fresh system):
```zsh
sudo dnf remove docker \
                docker-client \
                docker-client-latest \
                docker-common \
                docker-latest \
                docker-latest-logrotate \
                docker-logrotate \
                docker-selinux \
                docker-engine-selinux \
                docker-engine
```

4. Install [Docker Desktop](https://docs.docker.com/desktop/install/mac-install/):
```zsh
wget https://desktop.docker.com/linux/main/amd64/149282/docker-desktop-4.30.0-x86_64.rpm\?utm_source\=docker\&utm_medium\=webreferral\&utm_campaign\=docs-driven-download-linux-amd64 -O ~/Downloads/docker-desktop.rpm
sudo dnf install ~/Downloads/docker-desktop.rpm
```

5. Run the dev environment for the first time by executing:
```zsh
./dev.sh
```

6. The dev page should be already accessible through http://localhost:3000

7. Once Docker has created the Caddy container, we can install its local certificate by executing
```zsh
sh ./install-cert-fedora.sh
```

8. Update the host file: Add the line
```
127.0.0.1   local.rbadal.com
```

9. The dev page should be now also accessible through https://local.rbadal.com