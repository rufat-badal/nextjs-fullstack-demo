source ./utils.dev.sh

# Remove old certificates
sudo rm /etc/pki/ca-trust/source/Caddy_Local_Authority*.p11-kit
docker_compose_dev cp caddy:/data/caddy/pki/authorities/local/root.crt /tmp/root.crt
sudo trust anchor --store /tmp/root.crt
sudo update-ca-trust
