안녕하세요. SSH 포트 포워딩 방법을 소개해 드립니다.

1. 개념도
    ![image](https://github.com/pwn4all/repository/assets/66910989/622c801a-9e71-4496-b4d3-ec70ff59b5da)

2. 개념도 개략 설명

* 경유서버에서 목적서버로 SSH Tunneling 설정을 하고
* 클라이언트에서 SSH Tunneling 으로 오픈된 포트로 접근하면
* 클라이언트가 목적서버로 접근할 수 없는 네트워크 환경에서도 경유 서버를 통해서 접근 가능합니다.

3. 설정 및 경유서버를 통한 목적서버 접근 명령어
    3-1. 경유 서버에 SSH Tunneling 연결

```bash
# 명령어 형식
# ssh -L [경우서버all ip]:[경유서버ssh port]: [목적서버ip]@[목적서버][port]

$ ssh -L 0.0.0.0:2222:192.168.0.30:22 user@192.168.0.30
(user@192.168.0.30) Password:  **(목적서버 user 비밀번호 입력)**
Last login: Wed Jan 31 07:57:10 2024 from 192.168.0.20

(목적서버)$ hostname
목적서버
(목적서버)$
```

3-2. 클라이언트에서 경유 서버에 SSH Tunneling 으로 오픈된 Port 를 이용해서 목적서버 접근

```bash
# 명령어 형식
# ssh -p[경유서버 Listen port] [목적서버 id]@[경유서버IP]
$ ssh -p2222 username@20.20.20.20
(user@192.168.0.30) Password:  **(목적서버 user 비밀번호 입력)**
Last login: Wed Jan 31 07:57:10 2024 from 192.168.0.20

(목적서버)$ hostname
목적서버
(목적서버)$
```

※ 참고사이트
[SSH Tunneling Reference](https://www.ssh.com/academy/ssh/tunneling-example)
