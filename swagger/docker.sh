docker run -d --name swagger_docker -v $PWD/swagger-docker.yaml:/app/swagger.yaml -e SWAGGER_JSON=/app/swagger.yaml -p 50386:8080 172.16.0.183:8082/dcs/swagger-ui:v3.25.4
