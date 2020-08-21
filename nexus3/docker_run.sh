docker run \
	-d \
	--name AP_Nexus3 \
	-p 8081:8081 \
	-p 8083:8083 \
	-v /var/nexus3/data:/nexus-data \
	-v /var/nexus3/work:/sonatype-work/nexus3 \
	sonatype/nexus3
