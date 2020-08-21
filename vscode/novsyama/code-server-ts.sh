docker run --name=vscode -p 10009:8443 -d \
 -v "${PWD}/project:/home/coder/project" \
 -w /home/coder/project \
 novsyama/code-server-ts \
 --user root \
 code-server \
 --auth none
