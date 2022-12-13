# crontab
```bash
00 03 * * * /opensearch/utils/del_index.sh > /opensearch/logs/del_index.log 2>&1
```



# del_index.sh
```bash
#!/bin/bash

################################################################
## commands
################################################################
CURL=/usr/bin/curl
DATE=/usr/bin/date
ECHO=/usr/bin/echo
SLEEP=/usr/bin/sleep
BASE64=/usr/bin/base64


################################################################
## values
################################################################
ACCINFO=YWR6dxaGRrczEh2pkcWhtaW4
DELDATE=$($DATE '+%Y%m%d' -d '180 days ago')

$ECHO $DELDATE


################################################################
## delete index
################################################################
$CURL -XDELETE --insecure -u $($ECHO $ACCINFO|$BASE64 --decode) https://localhost:9200/asfs-fam-$DELDATE
$SLEEP 5
$CURL -XDELETE --insecure -u $($ECHO $ACCINFO|$BASE64 --decode) https://localhost:9200/asfs-pay-$DELDATE

$SLEEP 5

################################################################
## get index
################################################################
$CURL -XGET --insecure -u $($ECHO $ACCINFO|$BASE64 --decode) https://localhost:9200/asfs-fam-$DELDATE/_search
$ECHO -e "\n"
$SLEEP 5
$CURL -XGET --insecure -u $($ECHO $ACCINFO|$BASE64 --decode) https://localhost:9200/asfs-pay-$DELDATE/_search
$ECHO -e "\n"
```
