# PostgreSQL + pgAdmin in Docker (macOS/Linux) [Setup Time = 3 Minutes]
This setup runs **PostgreSQL** and **pgAdmin** in Docker using a simple script.  
Credentials are preconfigured:  

- **Postgres**  
  - User: `root`  
  - Password: `public`  
  - Database: `mydb`  
  - Port: `5432`

- **pgAdmin**  
  - URL: [http://localhost:8080](http://localhost:8080)  
  - Email: `root`  
  - Password: `public`
---
## 1. Requirements
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed & running
- Bash shell (default on macOS/Linux)
---
## 2. Run Setup
```bash
chmod +x run-postgres.sh
./run-postgres.sh
```
---
## 3. Connect pgAdmin to PostgreSQL
1. Open pgAdmin → [http://localhost:8080](http://localhost:8080)  
   - Email: `root`  
   - Password: `public`  
2. Add new server in pgAdmin:  
   - Name: `postgres`  
   - Host: `postgres`  
   - Port: `5432`  
   - Username: `root`  
   - Password: `public`  
---
## 4. Manage Containers
- Stop:
  ```bash
  docker stop postgres pgadmin
  ```
- Start:
  ```bash
  docker start postgres pgadmin
  ```
- Remove (keeps DB data):
  ```bash
  docker rm -f postgres pgadmin
  ```
- Reset (remove everything, including DB data):
  ```bash
  docker rm -f postgres pgadmin && docker volume rm pgdata
  ```
---
You now have PostgreSQL + pgAdmin running locally with persistent storage.
