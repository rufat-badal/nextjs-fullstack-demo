source ./utils.dev.sh

# Stop all running containers
# we need to surround $running_containers with "" in order to assure that the string
# is not split up in the case of multiple running containers
running_containers=$(docker ps -q)
if [ ! -z "$running_containers" ]; then
    docker kill $running_containers
fi

# Remove ALL old containers
containers=$(docker ps -aq)
if [ ! -z "$containers" ]; then
    docker rm $containers
fi

# Remove all unused anonymous docker volumes
# In our case this makes sure that the anonymous postgres volumes from
# previous runs are deleted
docker volume prune -f

# Only create docker network if it does not exist
if [ ! "$(docker network ls | grep $DOCKER_NETWORK)" ]; then
    docker network create $DOCKER_NETWORK
fi

# Build dev
docker_compose_dev build

# Up dev
docker_compose_dev up --renew-anon-volumes
