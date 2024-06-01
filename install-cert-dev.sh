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
    SHA1=$(head -c 40 $ROOT_CRT_SHA1_FILE)
    match=$(sudo security find-certificate -a -c "Caddy" -Z | grep ^SHA-1 | grep -i $SHA1)
    if [ ! -z "$match" ]; then
        echo "Deleting old certificate"
        sudo security delete-certificate -Z $SHA1
    fi
    sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain /tmp/root.crt
    
    crt_sha1 /tmp/root.crt > $ROOT_CRT_SHA1_FILE
else
    echo "$OSTYPE is not supported"
fi
rm /tmp/root.crt
