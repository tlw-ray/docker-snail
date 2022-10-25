docker run --name agraph -d \
	--shm-size 1g \
	-v $PWD/data/agdata:/agraph/data \
	-v $PWD/config:/atgaph/etc \
	-e AGRAPH_SUPER_USER=oro \
	-e AGRAPH_SUPER_PASSWORD=@Operations1 \
	-p 10000-10035:10000-10035 \
	franzinc/agraph:v7.3.0
