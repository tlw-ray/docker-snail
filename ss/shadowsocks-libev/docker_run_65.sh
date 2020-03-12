docker run \
-d \
--name SV_ShadowsocksLibev65 \
--restart always \
-p 1081:1080 \
shadowsocks/shadowsocks-libev \
ss-local \
-s "65.49.224.65" \
-k "6unoL7yzpKY_%a)" \
-p "8888" \
-l "1080" \
-m "aes-256-gcm"
