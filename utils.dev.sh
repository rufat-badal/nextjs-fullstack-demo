DOCKER_NETWORK="my-network"
DOCKER_COMPOSE_FILE="docker-compose.dev.yml"
ENV_FILE=".env"
ENV_FILE_SECRET=".env.local"

docker_compose_dev() {
    docker compose --env-file $ENV_FILE --env-file $ENV_FILE_SECRET -f $DOCKER_COMPOSE_FILE "$@"
}
