#!/usr/bin/env bash
set -e

echo "Stopping and Removing the PostgreSQL + pgAdmin conatiners and  pg-network with postfix -priv..."
docker stop postgres_priv && docker rm postgres_priv 2>/dev/null || true
docker stop pgadmin_priv && docker rm pgadmin_priv 2>/dev/null || true
docker network rm pg-network-priv 2>/dev/null || true

echo "Creating pg-networ-priv network..."
docker network create pg-network-priv

echo "Starting PostgreSQL + pgAdmin containers..."
# Create Postgres container
docker run -d   --name postgres_priv --network pg-network-priv  -e POSTGRES_USER=root   -e POSTGRES_PASSWORD=public   -e POSTGRES_DB=mydb   -p 5432:5432   -v pgdata:/var/lib/postgresql/data   postgres:15
# Create pgAdmin container
docker run -d   --name pgadmin_priv --network pg-network-priv -e PGADMIN_DEFAULT_EMAIL=root@gmail.com   -e PGADMIN_DEFAULT_PASSWORD=public   -p 8080:80   dpage/pgadmin4

echo "PostgreSQL is installed and running on port 5432"
echo "pgAdmin is installed and vailable at: http://localhost:8080"
echo "Login to pgAdmin with the following credentials:"
echo "   → Email: root@gmail.com"
echo "   → Password: public"
