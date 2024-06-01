DOCKER_NETWORK="my-network"
DOCKER_COMPOSE_FILE="docker-compose.dev.yml"
ENV_FILE=".env"
ENV_FILE_SECRET=".env.local"
ROOT_CRT_SHA1_FILE="rootcrt_sha1sum.txt"
ROOT_CRT_COMMON_NAME="Caddy Local Authority"

docker_compose_dev() {
    docker compose --env-file $ENV_FILE --env-file $ENV_FILE_SECRET -f $DOCKER_COMPOSE_FILE "$@"
}
