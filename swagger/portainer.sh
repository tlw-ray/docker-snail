docker run -d --name API_Portainer -v $PWD/swagger-portainer.yaml:/app/swagger.yaml -e SWAGGER_JSON=/app/swagger.yaml -p 50385:8080 172.16.0.183:8082/dcs/swagger-ui:v3.25.4
