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
