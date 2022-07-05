#### opensearch : <https://opensearch.org/>
#### manual : <https://opensearch.org/docs/latest/clients/agents-and-ingestion-tools/index/#downloads/>
#### my latest version : 7.12.1
#### standalone type not multi node


* * *
#### 1. base direct is /opensearch
```bash
$ sudo mkdir /opensearch

$ sudo chown user:user /opensearch

```

* * *
#### 2. download opensearch-latest-version.tar.gz

```bash
1. go to https://opensearch.org/downloads.html

2. download latest version
  ex)
  $ wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-oss-7.12.1-linux-x86_64.tar.gz

```

* * *
#### 3. decompress filebeat-latest-version.tar.gz

```bash
$ tar -zxvf filebeat-oss-7.12.1-linux-x86_64.tar.gz -C /opensearch

```


#### 4. basic setting
```bash
---------------------------------------------------
$ cd /opensearch/filebeat-7.12.1-linux-x86_64
---------------------------------------------------
$ vi filebeat-stable.yml
.
.
.
#### target file
- type: log

  # Change to true to enable this input configuration.
  #enabled: false
  enabled: true
  encoding: euc-kr

  # Paths that should be crawled and fetched. Glob based paths.
  paths:
    #- /var/log/*.log
    #- c:\programdata\elasticsearch\logs\*
    - /opensearch/input/result.txt
.
.
.
---------------------------------------------------

```

#### 6. add script file about start/stop/status for working
```bash
---------------------------------------------------
$ vi filebeat.sh
---------------------------------------------------
#!/bin/sh

HOMEPATH=/opensearch/filebeat-7.12.1-linux-x86_64

if [ $# -ne 1 ]; then
    echo "Usage: $0 start|stop|staus"
    exit -1
# start
elif [ "$1" == "start" ]; then
    $HOMEPATH/filebeat -c $HOMEPATH/filebeat-stable.yml -e&
elif [ "$1" == "stop" ]; then
    kill -9 $(ps -ef | grep filebeat | grep -v grep | awk '{print $2}')
elif [ "$1" == "status" ]; then
    ps -ef | grep filebeat | grep -v grep | grep -v status
else
    echo "Usage: $0 start|stop|status"
fi
fi
---------------------------------------------------
$ ./filebeat.sh start
$ ./filebeat.sh stop
$ ./filebeat.sh status
---------------------------------------------------
```

#### 7. add service file of systemd for working
```bash
---------------------------------------------------
$ sudo vi /usr/lib/systemd/system/filebeat.service
---------------------------------------------------

[Unit]
Description=filebeat
Documentation=https://opensearch.org/docs/
After=network.target

[Service]
RuntimeDirectory=filebeat
ExecStart=/opensearch/filebeat-7.12.1-linux-x86_64/filebeat -c /opensearch/filebeat-7.12.1-linux-x86_64/filebeat-stable.yml
Restart=always
WorkingDirectory=/opensearch/filebeat-7.12.1-linux-x86_64
User=user
Group=user

StandardOutput=journal
StandardError=inherit

[Install]
WantedBy=multi-user.target

-----------------------------------------------------------------------------------------
## have to run daemon-reload command after creating service file
$ sudo systemctl daemon-reload

$ sudo systemctl start filebeat.service
$ sudo systemctl stop filebeat.service
$ sudo systemctl status filebeat.service
---------------------------------------------------
```


