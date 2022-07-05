#### opensearch : <https://opensearch.org/>
#### manual : <https://opensearch.org/docs/latest/opensearch/install/index/>
#### my latest version : 2.0.1
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
  $ wget https://artifacts.opensearch.org/releases/bundle/opensearch/2.0.1/opensearch-2.0.1-linux-x64.tar.gz

```

* * *
#### 3. decompress opensearch-latest-version.tar.gz

```bash
$ tar -zxvf opensearch-2.0.1-linux-x64.tar.gz -C /opensearch

```

#### 4. install and connect test
```bash
---------------------------------------------------
$ cd /opensearch/opensearch-2.0.1/
---------------------------------------------------
$ ./opensearch-tar-install.sh
.
.
.
WARNING: Please consider reporting this to the maintainers of org.opensearch.bootstrap.Security
WARNING: System::setSecurityManager will be removed in a future release
---------------------------------------------------
$ curl -XGET https://localhost:9200 -u 'admin:admin' --insecure
{
  "name" : "opensearch",
  "cluster_name" : "opensearch",
  "cluster_uuid" : "yM-o8HibT46cKdfv9JRl0w",
  "version" : {
    "distribution" : "opensearch",
    "number" : "2.0.1",
    "build_type" : "tar",
    "build_hash" : "6462a546240f6d7a158519499729bce12dc1058b",
    "build_date" : "2022-06-15T08:47:42.243126494Z",
    "build_snapshot" : false,
    "lucene_version" : "9.1.0",
    "minimum_wire_compatibility_version" : "7.10.0",
    "minimum_index_compatibility_version" : "7.0.0"
  },
  "tagline" : "The OpenSearch Project: https://opensearch.org/"
}

```

#### 5. basic setting
```bash
---------------------------------------------------
#### memory
$ sudo vi /etc/sysctl.conf
.
.
.
vm.max_map_count=262144

$ sudo sysctl -p

$ cat /proc/sys/vm/max_map_count
262144

---------------------------------------------------
#### ip and port 
$ cd /opensearch/opensearch-2.0.1/config
$ vi opensearch.yml
# _local_ : 127.0.0.1
# _site_ : all ips except _local_
# then _local_, _site_ means all ips for listen
network.host: ["_local_", "_site_"]

# listen port
http.port: 9200

---------------------------------------------------
#### jvm memory
$ vi jvm.options
.
.
# Optimized for your server
-Xms1g 
-Xmx1g
.
.
---------------------------------------------------
```

#### 6. add script file about start/stop/status for working
```bash
---------------------------------------------------
$ vi opensearch.sh
---------------------------------------------------
HOMEPATH=/usr/local/opensearch-2.0.1
PIDFILE=os.pid
if [ $# -ne 1 ]; then
    echo "Usage: $0 start|stop|staus"
    exit -1
# start
elif [ "$1" == "start" ]; then
    $HOMEPATH/bin/opensearch -d -p $HOMEPATH/$PIDFILE
elif [ "$1" == "stop" ]; then
  if [ -f "$HOMEPATH/$PIDFILE" ]; then
    kill -9 $(cat $HOMEPATH/$PIDFILE)
    rm -rf $PIDFILE
  fi
elif [ "$1" == "status" ]; then
  if [ -f "$HOMEPATH/$PIDFILE" ]; then
    ps -ef | grep $(cat $HOMEPATH/$PIDFILE) | grep -v grep
  fi
else
    echo "Usage: $0 start|stop|status"
fi
---------------------------------------------------
$ ./opensearch.sh start
$ ./opensearch.sh stop
$ ./opensearch.sh status
---------------------------------------------------
```

#### 7. add service file of systemd for working
```bash
---------------------------------------------------
$ sudo vi /usr/lib/systemd/system/opensearch.service
---------------------------------------------------
[Unit]
Description=opensearch
Documentation=https://opensearch.org/docs/
After=network.target

[Service]
RuntimeDirectory=opensearch
ExecStart=/opensearch/opensearch-2.0.1/bin/opensearch
Restart=always
WorkingDirectory=/opensearch/opensearch-2.0.1/
User=user
Group=user

# print error
StandardOutput=journal
StandardError=inherit

# Specifies the maximum file descriptor number that can be opened by this process
LimitNOFILE=262144

# Specifies the maximum number of processes
LimitNPROC=4096

# Specifies the maximum size of virtual memory
LimitAS=infinity

# Specifies the maximum file size
LimitFSIZE=infinity

# Disable timeout logic and wait until process is stopped
TimeoutStopSec=0

# SIGTERM signal is used to stop the Java process
KillSignal=SIGTERM

# Send the signal only to the JVM rather than its control group
KillMode=process

# Java process is never killed
SendSIGKILL=no

# When a JVM receives a SIGTERM signal it exits with code 143
SuccessExitStatus=143

# Allow a slow startup before the systemd notifier module kicks in to extend the timeout
TimeoutStartSec=75

[Install]
WantedBy=multi-user.target

-----------------------------------------------------------------------------------------
## have to run daemon-reload command after creating service file
$ sudo systemctl daemon-reload

$ sudo systemctl start opensearch.service
$ sudo systemctl stop opensearch.service
$ sudo systemctl status opensearch.service

```


