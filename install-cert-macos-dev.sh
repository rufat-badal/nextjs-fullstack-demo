source ./utils.dev.sh

docker_compose_dev cp caddy:/data/caddy/pki/authorities/local/root.crt /tmp/root.crt
sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain /tmp/root.crt
