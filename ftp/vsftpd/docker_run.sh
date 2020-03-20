docker run -d -v $PWD/vsftpd:/home/vsftpd \
                -p 20:20 \
		-p 21:21 \
		-p 47400-47470:47400-47470 \
                -e FTP_USER=ftpUsername \
                -e FTP_PASS=ftpPassword \
                -e PASV_ADDRESS=192.168.0.120 \
                --name SV_VSFtp \
		bogem/ftp
