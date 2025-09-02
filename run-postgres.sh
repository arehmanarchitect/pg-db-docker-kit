#!/usr/bin/env bash
set -e

echo "🚀 Starting PostgreSQL + pgAdmin containers..."

# Remove old containers if they exist
docker rm -f postgres pgadmin 2>/dev/null || true

# Create Postgres container
docker run -d   --name postgres   -e POSTGRES_USER=root   -e POSTGRES_PASSWORD=public   -e POSTGRES_DB=mydb   -p 5432:5432   -v pgdata:/var/lib/postgresql/data   postgres:15

# Create pgAdmin container
docker run -d   --name pgadmin   -e PGADMIN_DEFAULT_EMAIL=root   -e PGADMIN_DEFAULT_PASSWORD=public   -p 8080:80   --link postgres:postgres   dpage/pgadmin4

echo "PostgreSQL is installed and running on port 5432"
echo "pgAdmin is installed and available at: http://localhost:8080"
echo "   → Email: root"
echo "   → Password: public"
