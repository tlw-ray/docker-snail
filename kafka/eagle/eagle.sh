docker run \
  --name AP_KafkaEagle \
  --rm \
  -d \
  -e ZK_LIST='192.168.0.72:2181' \
  -p 8080:8080 \
  tlwtlw/kafka-eagle:1.4.5
