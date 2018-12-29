## Docker Hub

Star at docker hub

https://hub.docker.com/r/endoffight/shadowsocks-kcp/

or docker store

https://store.docker.com/community/images/endoffight/shadowsocks-kcp

## HOW TO USE

cmd below shows how to disabled FASTOPEN , UDP_RELAY and COMPRESSION.

```bash
docker run -d --name=ss-server --restart=always -e FASTOPEN='' -e UDP_RELAY='' -e KCP_NOCOMP=--nocomp --net=host endoffight/shadowsocks-kcp
```

You can change ports

```bash
docker run -d --name=ss-server --restart=always -p 3306:37210/tcp -p 3306:37210/udp -p 3389:38240/udp endoffight/shadowsocks-kcp
```

OR just use default value

```bash
docker run -d --name=ss-server --restart=always --net=host endoffight/shadowsocks-kcp
```

Your config.json will be just like this:

```json
{
    "password" : "laogao",
    "method" : "aes-256-cfb",
    "server" : "8.9.10.11",
    "server_port" : 37210,
    "enabled_kcptun" : true,
    "kcptun" : {
      "nocomp" : false,
      "key" : "phpgao",
      "crypt" : "aes-192",
      "mtu" : 1350,
      "mode" : "fast2",
      "port" : 38240
    }
}
```

### ENV KEY & DEFAULT VALUE

| KEY         	| VALUE       	| YOU MAY CHANGE 	|
|-------------	|-------------	|----------------	|
| SERVER_ADDR 	| 0.0.0.0     	|                	|
| SERVER_PORT 	| 37210       	|               	|
| PASSWORD    	| laogao      	| ✅              	|
| METHOD      	| aes-256-cfb 	| ✅              	|
| TIMEOUT     	| 300         	|                	|
| FASTOPEN    	| --fast-open 	|                	|
| UDP_RELAY   	| -u          	|                	|
| DNS_ADDR    	| 8.8.8.8     	|                	|
| DNS_ADDR_2  	| 8.8.4.4     	|                	|
| ARGS        	| ''          	| ✅              	|
| KCP_LISTEN  	| 38240       	|                	|
| KCP_PASS    	| phpgao      	| ✅              	|
| KCP_ENCRYPT 	| aes-192     	| ✅              	|
| KCP_MODE    	| fast2       	| ✅              	|
| KCP_MUT     	| 1350        	|                	|
| KCP_NOCOMP  	| ''          	|                	|

## docker-compose

```yml
version: '2'

services:
  shadowsocks-kcp:
    image: endoffight/shadowsocks-kcp
    container_name: ss-server
    ports:
      - "8888:37210/tcp"
      - "8888:37210/udp"
      - "8889:38240/udp"
    environment:
      - PASSWORD=laogao
      - METHOD=rc4-md5
      - KCP_PASS=phpgao
      - KCP_ENCRYPT=aes-192
    restart: always
```

To use

```bash
wget https://raw.githubusercontent.com/phpgao/docker_images/master/shadowsocks-kcp/docker-compose.yml
docker-compose up -d
docker ps
```

Compose Doc

https://docs.docker.com/compose/compose-file/

## UPDATE_LOG

20171213:

 1. ADD simple-obfs,you can add `-e ARGS='--plugin obfs-server --plugin-opts "obfs=http"'` to enable obfs.

20171206:

 1. ADD docker-compose.yml.

20171205:

 1. UPDATE sss TO v3.1.1.
 2. UPDATE server_linux_amd64 TO v20171201.

20170322：

 1. ADD MORE ENV.
 2. SS RUNs IN nobody.
 3. UPDATE server_linux_amd64 TO v20170315.

## Feel free to ask 😄

