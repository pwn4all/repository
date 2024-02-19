# Xvnc(tiger vnc server) Setting
# 1. tiget vnc 설치
```bash
# dnf -y install tigervnc-server
```


# 2. 접속포트 변경
### 5900 + displayNumber(1부터 증가) 이므로 5900 을 원하는 번호로 변경해야 함
#### 위의 설정으로 최초 포트 : 5901
```bash
# vi /usr/bin/vncserver
.
.
.
$vncPort = 5900 + $displayNumber;
.
.
.
```

# 3. 비밀번호 설정(읽고 쓰기 화면 접속 설정)
```bash
# vncpasswd
Password:
Verify:
Would you like to enter a view-only password (y/n)? n
A view-only password is not used
#
# netstat -nap | grep "LISTEN "
.
.
tcp        0      0 0.0.0.0:5901            0.0.0.0:*               LISTEN      94586/Xvnc
.
.
#
```


# 4. 방화벽 오픈
```bash
# firewall-cmd --permanent --add-port=5901-5910/tcp
# firewall-cmd --reload
# firewall-cmd --list-all
```


# 5. 원격 접속
### VNC 클라이언트 또는 맥(화면공유)를 이용해서 접속


# 6. Xvnc 종료
### VNC 클라이언트 또는 맥(화면공유)
```bash
# vncserver -kill :1

WARNING: vncserver has been replaced by a systemd unit and is now considered deprecated and removed in upstream.
Please read /usr/share/doc/tigervnc/HOWTO.md for more information.
Killing Xvnc process ID 94586
#
```
