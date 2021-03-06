
**Best important two point of crontab**

**1) PATH**
```bash
Starting path is basic path of user.
For example, path is / or /root on cron of root. and path is /home/user on cron of user.

*Therefore, all path must be absolute path.
```


**2) Format**

```bash
--------------------------------------------------------------------------
* * * * * /usr/local/appweb/command.sh
m h d mo dw command
--------------------------------------------------------------------------
m : minute(0~59)
h : hour(0~23)
d : day(1~31)
mo: month(1~12)
dw: day of week(0~7), 0:Sunday
```

**3) Example**

```bash
--------------------------------------------------------------------------
$ crontab -l
--------------------------------------------------------------------------
* * * * * /usr/local/appweb/watchdog.sh
or
*/1 * * * * /usr/local/appweb/watchdog.sh

--------------------------------------------------------------------------
$ vi watchdog.sh
--------------------------------------------------------------------------
#!/bin/bash

. /home/user/.bashrc

###########################################################################
# commands
###########################################################################
CP=/usr/bin/cp
AWK=/usr/bin/awk
SED=/usr/bin/sed
DATE=/usr/bin/date
HEAD=/usr/bin/head
PYTHON=/usr/bin/python3

###########################################################################
# path
###########################################################################
APP_HOME=/usr/local/appweb


###########################################################################
# watch_dog
###########################################################################
APPWEB_CNT=$(ps -ef|grep appweb.py|grep -v grep|wc -l)

if [ "$APPWEB_CNT" -le 0 ]; then
    $PYTHON $APP_HOME/appweb.py&
fi

```


**4) Debugging tip**

```bash
--------------------------------------------------------------------------
$ crontab -l
--------------------------------------------------------------------------
* * * * * /usr/local/appweb/watchdog.sh >> /usr/local/appweb/logs/cron_err.log 2>&1


## you can to find trouble.
$ vi cron_err.log
.
.
File "/usr/local/flaskweb/flaskweb.py", line 8, in <module>
    logging.basicConfig(filename='./logs/flaskweb.log', level=logging.INFO)
.
.
.
FileNotFoundError: [Errno 2] No such file or directory: '/home/user/logs/flaskweb.log'  <= relative path error
```


**5) relative path tip in code**

```bash
1. if you read or write file using relative path in python code.
2. you meet err, because when cron is loaded path is user's default path
  - (ex : /home/user or /root ...)
3. therefore, you can add cd command like below
--------------------------------------------------------------------------
$ crontab -l
--------------------------------------------------------------------------
* * * * * cd /usr/local/appweb && /usr/bin/python3 ./appweb.py >> ./logs/cron_err.log 2>&1

```
