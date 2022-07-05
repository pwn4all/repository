**socat**
```bash
-------------------------------------------------------------
## install
$ sudo apt install socat
-------------------------------------------------------------
## usage for service
## socat tcp-l:[port],reuseaddr,fork EXEC:[filename]&
$ socat tcp-l:4444,reuseaddr,fork EXEC:./level0&

$ nc localhost 4444
AAAA
[+] ROP tutorial level0
[+] What's your name? [+] Bet you can't ROP me, AAAA!

-------------------------------------------------------------
## usage for ip
## socat TCP-LISTEN:4444,fork,reuseaddr TCP:0.0.0.0:8000
$ socat TCP-LISTEN:4444,fork TCP:0.0.0.0:8000 &
-------------------------------------------------------------
```
