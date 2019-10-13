docker run \
-d \
-p 4369:4369 \
-p 5671:5671 \
-p 15671:15671 \
-p 5672:5672 \
-p 15672:15672 \
-p 25672:25672 \
-p 61613:61613 \
--name RabbitMQ \
rabbitmq:3.7.16-management
# enable stomp plugin
docker exec RabbitMQ rabbitmq-plugins enable rabbitmq_stomp
docker restart RabbitMQ
