#### opensearch : <https://opensearch.org/>
#### manual : <https://opensearch.org/docs/latest/clients/logstash/index/>
#### my latest version : 7.16.3
#### standalone type not multi node


* * *
#### 1. base direct is /opensearch
```bash
$ sudo mkdir /opensearch

$ sudo chown user:user /opensearch

```

* * *
#### 2. download logstash-oss-latest-version.tar.gz

```bash
1. go to https://opensearch.org/downloads.html

2. download latest version (logstash-oss.....tar.gz)
  ex)
  $ wget https://artifacts.opensearch.org/logstash/logstash-oss-with-opensearch-output-plugin-7.16.3-linux-x64.tar.gz
```

* * *
#### 3. decompress opensearch-latest-version.tar.gz

```bash
$ tar -zxvf logstash-oss-with-opensearch-output-plugin-7.16.3-linux-x64.tar.gz -C /opensearch

```


#### 4. basic setting and test run
```bash
---------------------------------------------------
$ cd /opensearch/logstash-7.16.3/config

---------------------------------------------------
#### jvm memory
$ vi jvm.options
# Xms represents the initial size of total heap space
# Xmx represents the maximum size of total heap space

# Optimized for your server
-Xms1g
-Xmx1g
.
.
---------------------------------------------------
$ vi logstash-sample.conf
input {
  stdin {}
}

output {
  stdout {}
}
---------------------------------------------------

---------------------------------------------------
### test stdin(hello logstash) -> stdout(rubydebug format)

$ cd /opensearch/logstash-7.16.3
$ ./bin/logstash -f ./config/logstash-sample.conf
Using bundled JDK: /usr/local/logstash-7.16.3/jdk
.
.
.
hello logstash
{
      "@version" => "1",
       "message" => "hello logstash",
    "@timestamp" => 2022-07-05T05:43:32.956Z,
          "host" => "opensearch"
}
---------------------------------------------------
```

#### 6. add script file about start/stop/status for working
```bash
$ vi logstash.sh
#!/bin/sh

if [ $# -ne 1 ]; then
    echo "Usage: $0 start|stop|staus"
    exit -1
# start
elif [ "$1" == "start" ]; then
    ./bin/logstash -f ./config/logstash-stable.conf&
    #nohup ./bin/logstash -f ./config/logstash-stable.conf&
elif [ "$1" == "stop" ]; then
    kill -9 $(ps -ef | grep logstash | grep -v grep | awk '{print $2}')
elif [ "$1" == "status" ]; then
    ps -ef | grep logstash | grep -v grep | grep -v status
else
    echo "Usage: $0 start|stop|status"
fi

$ ./logstash.sh start
$ ./logstash.sh stop
$ ./logstash.sh status
```

#### 7. add service file of systemd for working
```bash
$ sudo vi /usr/lib/systemd/system/logstash.service

[Unit]
Description=logstash
Documentation=https://opensearch.org/docs/
After=network.target

[Service]
RuntimeDirectory=logstash
ExecStart=/opensearch/logstash-7.16.3/bin/logstash -f /opensearch/logstash-7.16.3/config/logstash-stable.conf
Restart=always
WorkingDirectory=/usr/local/logstash-7.16.3
User=user
Group=user

# Specifies the maximum file descriptor number that can be opened by this process
LimitNOFILE=262144

#StandardOutput=journal
#StandardError=inherit

[Install]
WantedBy=multi-user.target

-----------------------------------------------------------------------------------------
## have to run daemon-reload command after creating service file
$ sudo systemctl daemon-reload

$ sudo systemctl start logstash.service
$ sudo systemctl stop logstash.service
$ sudo systemctl status logstash.service

```

#### 8. configuration
```bash
---------------------------------------------------
### 1) format of .conf
input{} -> filter{} -> output{}


---------------------------------------------------
### 2) input
### - stdin{}, tcp{}, beats{}, file{},  ... (your choice)

$ vi ./config/logstash-stable.conf
input {
  #stdin {}

  # tcp {
  #   port => 9900
  # }

  beats {
    port => 5044
  }

  #file {
  #  path => "/opensearch/input/result.txt"
  #  start_position => "beginning"
  #  sincedb_path => "/dev/null"
    #codec => plain{ charset => "ISO-8859-1"}
    #codec => plain{ charset => "UTF-8"}
  #  codec => plain{ charset => "EUC-KR"}
  #}
}

### 3) filter
### - mutate{}, csv{}, grok{}, ...(your choice)
filter {
  # remove the char(") from the message text, because the csv message text shouldn't contain any char("). 
  mutate {
    gsub => [
      'message', '\"', ''
    ]
  }
  
  csv {
    #source => message

    # seperated column-name from message (your choice)
    columns => ["column-1", "column-2", "column-3", "column-4", "column-5", "column-6", "column-7"]

    #separator => "\t"             # not working in csv filter
    #separator => " "              # working but you can't use when message have many space( )
    separator => ","               # working but you can't use when message have many comma(,)

    skip_empty_columns => true
  }
  
  mutate {
    remove_field => ["@version", "host"]
  }

  # set date when keyword %{+yy.MM.dd} doesn't work
  ruby {
    init => "require 'time'"
    code => "event.set('indexDate', Time.now.utc.getlocal.strftime('%Y%m%d'))"
  }
}

### 4) output
### - opensearch, stdout{} ...(your choice)
output {
  opensearch {
    hosts => ["https://localhost:9200"]
    ssl => true
    ssl_certificate_verification => true
    cacert => "/usr/local/config/root-ca.pem"
    user => "admin"
    password => "admin"
    #user => "${OS_USR}"
    #password => "${OS_PWD}"
    #auth_type => {
    #  type => 'basic'
    #  user => 'admin'
    #  password => 'admin'
    #}

    index => "logstash-%{indexDate}"

  }
  stdout {}
}


```
