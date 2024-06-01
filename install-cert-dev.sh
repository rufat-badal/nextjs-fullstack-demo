source ./utils.dev.sh

docker_compose_dev cp caddy:/data/caddy/pki/authorities/local/root.crt /tmp/root.crt
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source /etc/os-release
    if [ "$ID" == "fedora" ]; then
        # Remove old certificates
        sudo rm /etc/pki/ca-trust/source/Caddy_Local_Authority*.p11-kit
        sudo trust anchor --store /tmp/root.crt
        sudo update-ca-trust
    else
        echo "$PRETTY_NAME is not supported"
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Old certificates need to be still deleted by hand
    sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain /tmp/root.crt
else
    echo "$OSTYPE is not supported"
fi
