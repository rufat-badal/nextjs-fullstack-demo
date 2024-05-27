docker compose -f docker-compose.dev.yml --env-file .env.local cp caddy:/data/caddy/pki/authorities/local/root.crt /tmp/root.crt
sudo trust anchor --store /tmp/root.crt
sudo update-ca-trust