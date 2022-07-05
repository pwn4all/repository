#### opensearch : <https://opensearch.org/>
#### manual : <https://opensearch.org/docs/latest/dashboards/index/>
#### my latest version : 2.0.1
#### standalone type not multi node


* * *
#### 1. base direct is /opensearch
```bash
$ sudo mkdir /opensearch

$ sudo chown user:user /opensearch

```

* * *
#### 2. download opensearch-dashboards-latest-version.tar.gz

```bash
1. go to https://opensearch.org/downloads.html

2. download latest version (opensearch-dashboards.....tar.gz)
  ex)
  $ wget https://artifacts.opensearch.org/releases/bundle/opensearch-dashboards/2.0.1/opensearch-dashboards-2.0.1-linux-x64.tar.gz

```

* * *
#### 3. decompress opensearch-dashboards-latest-version.tar.gz

```bash
$ tar -zxvf opensearch-dashboards-2.0.1-linux-x64.tar.gz -C /opensearch/

```


#### 4. basic setting
```bash
$ cd /opensearch/opensearch-dashboards-2.0.1/config/
---------------------------------------------------
#### ip and port
$ vi opensearch_dashboards.yml
# OpenSearch Dashboards is served by a back end server. This setting specifies the port to use.
server.port: 5601

# To allow connections from remote users, set this parameter to a non-loopback address.
# server.host: "localhost"
server.host: 0.0.0.0                # all ips of server

# The OpenSearch Dashboards server's name.  This is used for display purposes.
# server.name: "your-hostname"
server.name: "opensearch"           # your hostname

---------------------------------------------------
#### ssl 
# Enables SSL and paths to the PEM-format SSL certificate and SSL key files, respectively.
# These settings enable SSL for outgoing requests from the OpenSearch Dashboards server to the browser.
# server.ssl.enabled: false
# server.ssl.certificate: /path/to/your/server.crt
# server.ssl.key: /path/to/your/server.key
server.ssl.enabled: true
server.ssl.certificate: /usr/local/config/esnode.pem
server.ssl.key: /usr/local/config/esnode-key.pem

---------------------------------------------------
```

#### 6. add script file about start/stop/status for working
```bash
$ cd /opensearch/opensearch-dashboards-2.0.1
$ vi dashboards.sh
#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 start|stop|staus"
    exit -1
# start
elif [ "$1" == "start" ]; then
    ./bin/opensearch-dashboards -c ./config/opensearch_dashboards.yml&
elif [ "$1" == "stop" ]; then
    kill -9 $(ps -ef|grep /node/bin/node | grep /src/cli/dist | awk '{print $2}')
elif [ "$1" == "status" ]; then
    ps -ef|grep /node/bin/node | grep /src/cli/dist
else
    echo "Usage: $0 start|stop|status"
fi

---------------------------------------------------
## have to run daemon-reload command after creating service file
$ sudo systemctl daemon-reload

$ ./dashboards.sh start
$ ./dashboards.sh stop
$ ./dashboards.sh status
---------------------------------------------------
```

#### 7. add service file of systemd for working
```bash
$ sudo vi /usr/lib/systemd/system/opensearch.service

[Unit]
Description=opensearch-dashboards
Documentation=https://opensearch.org/docs/
After=network.target

[Service]
RuntimeDirectory=opensearch-dashboards
ExecStart=/opensearch/opensearch-dashboards-2.0.1/bin/opensearch-dashboards "-c /opensearch/opensearch-dashboards-2.0.1/config/opensearch_dashboards.yml"
Restart=always
WorkingDirectory=/usr/local/opensearch-dashboards-2.0.1
User=user
Group=user

StandardOutput=journal
StandardError=inherit

[Install]
WantedBy=multi-user.target

-----------------------------------------------------------------------------------------
## have to run daemon-reload command after creating service file
$ sudo systemctl daemon-reload

$ sudo systemctl start opensearch-dashboards.service
$ sudo systemctl stop opensearch-dashboards.service
$ sudo systemctl status opensearch-dashboards.service

```

#### 8. connect to https://your-ip-address:5601
```bash
1. run web browser(ex. chrome, firefox ...)
2. surf to https://localhost:5601
```


