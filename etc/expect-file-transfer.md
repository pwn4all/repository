***file transfer using expect***


```bash
-------------------------------------------
# target filename has date
-------------------------------------------
$ ls test-2022-07-17.log
test-2022-07-17.log
$ ls test-2022-07-18.log
test-2022-07-18.log
-------------------------------------------
```


```bash
-------------------------------------------
$ vi ./scpconn.exp
-------------------------------------------
#!/usr/bin/expect

set TODAY [timestamp -format {%Y-%m-%d}]
#set YESTERDAY [exec date -v -1d "+%Y-%m-%d"]
set YESTERDAY [exec date -d yesterday "+%Y-%m-%d"]

spawn /usr/bin/scp -P22  /home/user/app-$YESTERDAY.log user@localhost:/app/files
set password "password"
expect {
    # when asked for a password
    "password:" { send "$password\r"; exp_continue }
    # When asked if you want to connect
    "connecting (yes/no)?" { send "yes\r"; exp_continue }
}
-------------------------------------------
$ chmod 755 ./scpconn.exp
-------------------------------------------
```


```bash
-------------------------------------------
# crontab with log(include error)
-------------------------------------------
* * * * * /app/scpconn/scpconn.exp > /app/scpconn/scpconn.log 2>&1
-------------------------------------------
```



```bash
-------------------------------------------
# using .sh
-------------------------------------------
#!/bin/bash

###########################################################################
# commands
###########################################################################
CP=/usr/bin/cp
DATE=/usr/bin/date

###########################################################################
# varibles
###########################################################################
FILEPATH=/app/files/

TODAY=$($DATE "+%Y-%m-%d")
#YESTERDAY=$($DATE -v -1d "+%Y-%m-%d")
YESTERDAY=$($DATE -d yesterday "+%Y-%m-%d")
PASSWORD=password

###########################################################################
# working
###########################################################################
expect <<EOF
set timeout 3

spawn /usr/bin/scp -P20022 /home/user/app-$YESTERDAY.log user@localhost:/app/files
#set password "password"
expect {
    # when asked for a password
    "password:" { send "$PASSWORD\r"; exp_continue }
    # When asked if you want to connect
    #"connecting (yes/no)?" { send "yes\r"; exp_continue }
}
EOF
-------------------------------------------
$ chmod 755 ./scpconn.sh
-------------------------------------------
```


