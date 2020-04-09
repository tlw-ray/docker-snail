docker run -p 8001:80 \
--name AP_PGAdmin \
-e "PGADMIN_DEFAULT_EMAIL=root@domain.com" \
-e "PGADMIN_DEFAULT_PASSWORD=root" \
-d dpage/pgadmin4:4.1
