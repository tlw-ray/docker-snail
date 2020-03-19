docker run \
-d \
--name SV_ShadowsocksLibev162 \
--restart always \
-p 1080:1080 \
shadowsocks/shadowsocks-libev \
ss-local \
-s "97.64.126.162" \
-k "4E6@7W4*hMHKufEZ" \
-p "8886" \
-l "1080" \
-m "aes-256-cfb"
