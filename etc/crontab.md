
**Best important two point of crontab**

**1) PATH**
```bash
Starting path is basic path.
For example, path is / or /root on cron of root. and path is /home/user on cron of user.
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
