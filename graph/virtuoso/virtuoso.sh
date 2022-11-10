docker run \
    --name my_virtdb \
    --interactive \
    --tty \
    --env DBA_PASSWORD=@Operations1 \
    --publish 1111:1111 \
    --publish  8890:8890 \
    --volume `pwd`/data:/database \
    openlink/virtuoso-closedsource-8:latest
