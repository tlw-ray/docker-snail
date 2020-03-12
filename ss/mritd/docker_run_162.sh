docker \
run \
--name \
SV_SS162 \
-d \
-p 1080:1080 \
mritd/shadowsocks \
-m "ss-local" \
-s "-s 97.64.126.162 -p 8886 -b 0.0.0.0 -l 1080 -m aes-256-cfb -k 4E6@7W4*hMHKufEZ"
