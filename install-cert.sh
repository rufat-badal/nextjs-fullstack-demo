docker compose -f docker-compose.dev.yml cp caddy:/data/caddy/pki/authorities/local/root.crt /tmp/root.crt
security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain /tmp/root.crt