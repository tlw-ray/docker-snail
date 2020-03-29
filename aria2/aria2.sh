mkdir -p /storage/aria2/config
chown -R 1001:1002 /storage/aria2/config
find /storage/aria2/config -type d -exec chmod 755 {} +
find /storage/aria2/config -type f -exec chmod 644 {} +
mkdir /storage/aria2/downloads
chown -R 1001:1002 /storage/aria2/downloads
find /storage/aria2/downloads -type d -exec chmod 755 {} +
find /storage/aria2/downloads -type f -exec chmod 644 {} +
cat > /storage/aria2/config/aria2.conf << EOF
save-session=/config/aria2.session
input-file=/config/aria2.session
save-session-interval=60

dir=/downloads

file-allocation=prealloc
disk-cache=128M

enable-rpc=true
rpc-listen-port=6800
rpc-allow-origin-all=true
rpc-listen-all=true

# rpc-secret=11111111

auto-file-renaming=false

max-connection-per-server=16
min-split-size=1M
split=16
EOF

docker run \
   -d \
   --name SV_Aria2 \
   --network host \
   -u=1001:1002 \
   -v /storage/aria2/config:/config \
   -v /storage/aria2/downloads:/downloads \
   opengg/aria2
