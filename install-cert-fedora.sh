docker compose -f docker-compose.dev.yml cp caddy:/data/caddy/pki/authorities/local/root.crt /tmp/root.crt
trust anchor --store /tmp/root.crt
update-ca-trust