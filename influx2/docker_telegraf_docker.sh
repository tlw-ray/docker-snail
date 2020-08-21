docker run -d --name SV_Telegraf_Docker \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $PWD/telegraf.conf:/etc/telegraf/telegraf.conf:ro \
  telegraf:1.13.4-alpine
