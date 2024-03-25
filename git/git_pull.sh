##########################################################################################
## git 초기화
##########################################################################################
$ git init


##########################################################################################
## git 자격증명 관리 방법(cache|store)
##########################################################################################
$ git config --global credential.helper cache|store


##########################################################################################
## access token 을 이용한 remote 저장소 설정
##########################################################################################
$ git remote set-url origin https://oauth2:access-token-string@gitlab.mygit.com/user/mypackage.git


##########################################################################################
## remote 브랜치 위에 local commit 을 재적용
## rebase 는 혼자 사용할 때만 사용(개발자가 여러명일 경우 git config pull.merge 사용)
##########################################################################################
$ git config pull.rebase true


##########################################################################################
## remote 저장소에서 pull
##########################################################################################
$ git pull origin main
From https://gitlab.tde.sktelecom.com/user/mypackage
 * branch            main       -> FETCH_HEAD
Successfully rebased and updated refs/heads/main.
$ ls
README.md      __pycache__    message.txt    thread.py     upload


##########################################################################################
## 로컬 저장소의 'main' 브랜치를 원격 저장소의 'origin' 저장소에 푸시(업로드)하고
## 원격 저장소와 브랜치를 자동으로 추적하도록(-u) 설정 
##########################################################################################
$ git push -uf origin main
Enumerating objects: 100, done.
Counting objects: 100% (100/100), done.
Delta compression using up to 10 threads
Compressing objects: 100% (89/89), done.
Writing objects: 100% (99/99), 893.64 KiB | 6.87 MiB/s, done.
Total 99 (delta 9), reused 0 (delta 0), pack-reused 0
remote:
To https://gitlab.tde.sktelecom.com/user/mypackage.git
   25f9459..3f305ae  main -> main
branch 'main' set up to track 'origin/main'.
$
