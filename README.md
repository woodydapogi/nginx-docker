# nginx-docker
1. Create a docker network
docker create network --subnet=<network.address/cidr> <network_name>

2. Ensure everything is set for your website. Go to your Dockerfile directory and enter
docker build -t <nginx-container-name> .

3. docker run -d --net <network_name> --ip <ip.address> <nginx-container-name>

4. Create reverse proxy
docker run -d --name reverse-proxy--net <network_name> --ip <ip.address> nginx

5. mdkir conf.d

echo "server {\n  listen 80 default_server;\n  server_name _;\n  location / {\n  proxy_pass http://192.168.2.10;\n  proxy_set_header Host $host;\
\n  proxy_set_header X-Real-IP $remote_addr;\n  }\n  }" > /conf.d/default.conf

docker cp conf reverse-proxy:/etc/nginx/conf.d/

docker restart reverse-proxy

