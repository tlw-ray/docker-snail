docker run -d \
--name oracle11g-xe \
--shm-size=1g \
-p 1521:1521 -p 8080:8080 \
-e ORACLE_PWD=admin \
oracle/database:11.2.0.2-xe
