docker run \
    --name AP_NoVNC_Filezilla \
    --detach \
    --publish 6080:6080 \
    gotget/novnc \
        --vnc 172.17.0.7:5900
