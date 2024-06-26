##########################################################################################
## git 초기화
##########################################################################################
rm README.md

git init
git add .
git commit -m "SERVICE"


##########################################################################################
## git 자격증명 관리 방법(cache|store)
##########################################################################################
git config --global credential.helper cache



##########################################################################################
## origin 제거 (error: remote origin already exists. 에러 처리)
##########################################################################################
git remote remove origin



##########################################################################################
## access token 을 이용한 remote 저장소 설정
## 문법 : https://oauth2:<Access-Token>@domain.name/package.git
##########################################################################################
git remote add origin https://oauth2:AfaU217kyc4m3wemXCpU@gitlab.com/package.git

git remote set-url origin https://oauth2:tde2-AfaU217kyc4m3wemXCpU@gitlab.com/package.git


git remote -v


##########################################################################################
## remote 브랜치 위에 local commit 을 재적용
## rebase 는 혼자 사용할 때만 사용(개발자가 여러명일 경우 git config pull.merge 사용)
##########################################################################################
git config pull.rebase true


git branch -M main


##########################################################################################
## remote 저장소에서 pull (README.md 등 서버 파일 pull)
##########################################################################################
git pull origin main

From https:/gitlab.com/package.git
 * branch            main       -> FETCH_HEAD
Successfully rebased and updated refs/heads/main.



##########################################################################################
## 로컬 저장소의 'main' 브랜치를 원격 저장소의 'origin' 저장소에 푸시(업로드)하고
## 원격 저장소와 브랜치를 자동으로 추적하도록(-u) 설정 
##########################################################################################
git push -uf origin main

Enumerating objects: 100, done.
Counting objects: 100% (100/100), done.
Delta compression using up to 10 threads
Compressing objects: 100% (89/89), done.
Writing objects: 100% (99/99), 893.64 KiB | 6.87 MiB/s, done.
Total 99 (delta 9), reused 0 (delta 0), pack-reused 0
remote:
To https://gitlab.com/package.git
   25f9459..3f305ae  main -> main
branch 'main' set up to track 'origin/main'.




