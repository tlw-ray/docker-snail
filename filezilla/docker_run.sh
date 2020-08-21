docker run \
	-d \
	--name SV_Filezilla \
	-p 5800:5800 \
	-p 5900:5900 \
	-v $PWD/config:/config:rw \
	-v $PWD/storage:/storage:rw \
	jlesage/filezilla
