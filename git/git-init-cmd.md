# &#35; commands of docker usage

#### &#42; git init manual : <https://git-scm.com/docs/git-init/>
#### &#42; git init ~ commit
```bash
# git config --list
git config --global user.name "username"
git config --global user.email "user@mail.com"


# check oring server addr
git remove -v

# initialize dictory
git init

# sync to local and git server
git clone  http://git.site.com/username/projectname.git

# add/store to staging area
git add .
or
git addfilename

# add/store to local repository
git commit -m "first commit"

git remote add origin http://git.site.com/username/projectname.git
or
git remote set-url origin http://git.site.com/username/projectname.git
git remote set-url origin username@git.site.com/username/projectname.git

# save to remote git server
git push -u origin master

```
