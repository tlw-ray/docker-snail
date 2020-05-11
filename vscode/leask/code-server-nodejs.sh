docker run --user root --name VSCode_Nodejs -d -it -p 10007:8080 -v "${PWD}/project:/home/coder/project" leask/code-server-nodejs --allow-http --no-auth
