server {
    listen ${LISTEN_PORT};
    server_name 92.222.217.160;

    location /static {
        alias /../vol/static;
    }
}