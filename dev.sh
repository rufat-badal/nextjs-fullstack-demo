# Stop all running containers
docker kill $(docker ps -aq) && docker rm $(docker ps -aq)

# Create a network, which allows containers to communicate
# with each other, by using their container name as a hostname
docker network create my-network

# --renew-anon-volumes does not work with the postgres container
# the command below will delete the anonymous volume of the postgres container
docker compose --env-file .env.local --env-file .env -f docker-compose.dev.yml rm -fv postgres

# Build dev
docker compose --env-file .env.local --env-file .env -f docker-compose.dev.yml build

# Up dev
# --renew-anon-volumes
#   postgres/mysql retrieve volumes from previous containers after being killed
docker compose --env-file .env.local --env-file .env -f docker-compose.dev.yml up --renew-anon-volumes
