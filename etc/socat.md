**socat**
```bash
## install
$ sudo apt install socat

## usaga : socat tcp-l:[port],reuseaddr,fork EXEC:[filename]&
$ socat tcp-l:4444,reuseaddr,fork EXEC:./level0&


$ nc localhost 4444
AAAA
[+] ROP tutorial level0
[+] What's your name? [+] Bet you can't ROP me, AAAA!


```
