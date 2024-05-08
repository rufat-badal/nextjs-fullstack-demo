# Stop all running containers
docker kill $(docker ps -aq) && docker rm $(docker ps -aq)

# Add this once we need 2 services to comminicate with each other
# Create a network, which allows containers to communicate
# with each other, by using their container name as a hostname
# docker network create my-network

# Build dev
docker compose --env-file .env.local -f docker-compose.dev.yml build

# Up dev
# --renew-anon-volumes
#   postgres/mysql retrieve volumes from previous containers after being killed
docker compose --env-file .env.local -f docker-compose.dev.yml up --renew-anon-volumes
