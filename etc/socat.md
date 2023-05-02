**socat**
```bash
##################################################################
## install
$ sudo apt install socat
##################################################################
## usage for service
## socat tcp-l:[port],reuseaddr,fork EXEC:[filename]&
$ socat tcp-l:4444,reuseaddr,fork EXEC:./level0&

$ nc localhost 4444
AAAA
[+] ROP tutorial level0
[+] What's your name? [+] Bet you can't ROP me, AAAA!

##################################################################
## usage for ip
## socat TCP-LISTEN:4444,fork,reuseaddr TCP:0.0.0.0:8000
$ socat TCP-LISTEN:4444,fork TCP:0.0.0.0:8000 &
##################################################################
```

```bash
##################################################################
## socat.sh
##################################################################
#!/bin/bash

if [ $# -ne 2 ]; then
        echo "Usage: $0 ./vuln 8888"
        echo usage: nohup /usr/bin/socat tcp-listen:8888,reuseaddr,fork exec:./vuln&
        exit -1
fi
# nohup /usr/bin/socat tcp-listen:8888,reuseaddr,fork exec:./vuln&
nohup /usr/bin/socat tcp-listen:$2,reuseaddr,fork exec:$1&
```
