# &#35; commands of docker usage

#### &#42; git init manual : <https://git-scm.com/docs/git-init/>
#### &#42; git config ~ init
```bash
## git config --list
git config --global user.name "username"
git config --global user.email "user@mail.com"

git config --unset user.email


## initialize dictory
git init
```

#### &#42; sync to local and git server
##### &#42; if you want to only push, must have to skip git clone command
```bash
git clone  http://git.site.com/username/projectname.git

```

#### &#42; git add ~ push
```bash
## add/store to staging area
git add [. | filename]

## check stauts
git status


## add/store to local repository
git commit -m "first commit"

git remote add origin http://git.site.com/username/projectname.git
or
git remote set-url origin http://git.site.com/username/projectname.git
git remote set-url origin username@git.site.com/username/projectname.git

## check oring server addr
git remote -v

## save to remote git server
git branch -M main
git push -uf origin main

```
