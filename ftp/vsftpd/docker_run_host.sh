docker run \
	-d \
	-v ${PWD}/vsftpd:/home/vsftpd \
        -e FTP_USER=ftpUsername \
        -e FTP_PASS=ftpPassword \
        -e PASV_ADDRESS=192.168.0.120 \
        --name SV_VSFtp \
	--network host \
	bogem/ftp
