# Remove old certificates
sudo rm /etc/pki/ca-trust/source/Caddy_Local_Authority*.p11-kit
docker compose -f docker-compose.dev.yml --env-file .env.local --env-file .env cp caddy:/data/caddy/pki/authorities/local/root.crt /tmp/root.crt
sudo trust anchor --store /tmp/root.crt
sudo update-ca-trust