# change date to yesterday


```bash
#!/bin/bash

################################################################
## commands
################################################################
AWK=/usr/bin/awk
DATE=/usr/bin/date
ECHO=/usr/bin/echo
GREP=/usr/bin/grep
SLEEP=/usr/bin/sleep
SYSTEMCTL=/usr/bin/systemctl
TIMEDATECTL=/usr/bin/timedatectl


################################################################
## get date using standard time
################################################################
$SYSTEMCTL start chronyd.service
$SLEEP 10

DATE_TODAY=$($DATE '+%Y-%m-%d %H:%M:%S')
DATE_YESTERDAY=$($DATE -d yesterday '+%Y-%m-%d %H:%M:%S')

#echo $DATE_TODAY
#echo $DATE_YESTERDAY

$SYSTEMCTL stop chronyd.service


################################################################
## find date
#echo "2022-08-04 15:37:34" | awk '{print $1}'
################################################################
SEOUL_DATE=$($ECHO $DATE_TODAY | $AWK '{print $1}')
SYS_DATE=$($ECHO $DATE_YESTERDAY | $AWK '{print $1}')


################################################################
## apply yesterday date
################################################################
if [ "$SYS_DATE" != "$SEOUL_DATE" ]; then
  $ECHO "adjust date to yesterday"
  $DATE -s "$DATE_YESTERDAY"
fi
```
