docker \
run \
--name \
SV_SS65 \
-d \
-p 1081:1080 \
mritd/shadowsocks \
-m "ss-local" \
-s "-s 65.49.224.65 -p 8888 -b 0.0.0.0 -l 1080 -m aes-256-cfb -k 6unoL7yzpKY_%a)"
