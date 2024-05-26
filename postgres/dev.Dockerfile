# Target your exact production database version
FROM postgres:16-alpine

# Seed database with placeholder data created by the create_data script
COPY *.sql /docker-entrypoint-initdb.d/