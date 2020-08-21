docker run -d --name SV_Telegraf_System72 \
  -e HOST_PROC=/host/proc \
  -v /proc:/host/proc:ro \
  -v $PWD/telegraf_system72.conf:/etc/telegraf/telegraf.conf:ro \
  telegraf:1.13.4-alpine
