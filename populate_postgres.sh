docker exec -it --detach postgres psql -U postgres-user -d customers -f /etc/postgresql/inserts.sql
