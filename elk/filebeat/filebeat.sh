docker run -d \
  --name=SV_Filebeat \
  --user=root \
  -v $PWD/hello.log:/hello.log \
  --volume="$PWD/filebeat.yml:/usr/share/filebeat/filebeat.yml:ro" \
  --volume="/var/lib/docker/containers:/var/lib/docker/containers:ro" \
  --volume="/var/run/docker.sock:/var/run/docker.sock:ro" \
  docker.elastic.co/beats/filebeat:7.6.1 filebeat -e -strict.perms=false
