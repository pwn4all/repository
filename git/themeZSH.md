# &#35; Git terminal theme(oh my zsh)
#### &#42; zsh theme : <https://ohmyz.sh/>
#### &#42; bash theme :<https://github.com/ohmybash/oh-my-bash/>

* * *
#### &#42; manual of install : <https://github.com/ohmyzsh/ohmyzsh/wiki/>

* * *
#### 1. download & install
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### 2. select theme
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

vi ~/.zshrc
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
source ~/.zshrc
```

#### 3. modify theme
```bash
vi /Users/user/.oh-my-zsh/themes/agnoster.zsh-theme
# Context: user@hostname (who am I and where am I)
prompt_context() {
  if [[ "$USERNAME" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    #prompt_segment black default "%(!.%{%F{yellow}%}.)%n@%m"
    #prompt_segment black default "%(!.%{%F{yellow}%}.)"
    prompt_segment black default "%(!.%{{yellow}%}.)"
  fi
}
source ~/.zshrc
```
![alt text](https://github.com/pwn4all/git/blob/main/img/ohmyzsh.png "agnoster theme")


#### 4-1. etc : zsh-autosuggestions plugin
#### &#42; main site : <https://github.com/zsh-users/zsh-autosuggestions/>
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

vi ~/.zshrc
plugins=(git zsh-autosuggestions)
source ~/.zshrc
```
![alt text](https://github.com/pwn4all/git/blob/main/img/zsh-autosuggestions.png "zsh-autosuggestions")


#### 4-2. etc : zsh-syntax-highlighting plugin
#### &#42; main site : <https://github.com/zsh-users/zsh-syntax-highlighting/>
```bash
## zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

vi ~/.zshrc
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source ~/.zshrc
```
![alt text](https://github.com/pwn4all/git/blob/main/img/ohmyzsh.png "zsh-syntax-highlighting")



#### 4-4. etc : environment
```bash
echo $ZSH_CUSTOM
/Users/user_id/.oh-my-zsh/custom

ls /Users/user_id/.oh-my-zsh/custom/plugins
example                 zsh-autosuggestions     zsh-syntax-highlighting

ls /Users/user_id/.oh-my-zsh/themes
.
.
agnoster.zsh-theme
.
.
robbyrussell.zsh-theme
.
.
```
