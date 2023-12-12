## brew clenup/upgrade 등을 수행하다 아래 에러 발생 시 해결 방법

## Error: Permission denied @ apply2files - /usr/local/

```bash
# https://blackdeerdev.com/brew-cleanup-error-permission-denied-apply2files/
# 1. /usr/local 디렉터리 권한 변경

sudo chown -R $(whoami):admin /usr/local/* \
&& sudo chmod -R g+rwx /usr/local/*

# 2. 전체 brew list reinstall

brew list --formula | xargs brew reinstall
or
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
