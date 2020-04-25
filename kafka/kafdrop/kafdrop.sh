docker run -d --rm -p 39000:9000 \
    -- name AP_Kafdrop \
    -e KAFKA_BROKERCONNECT=192.168.0.72:9092 \
    -e JVM_OPTS="-Xms32M -Xmx64M" \
    -e SERVER_SERVLET_CONTEXTPATH="/" \
    obsidiandynamics/kafdrop
