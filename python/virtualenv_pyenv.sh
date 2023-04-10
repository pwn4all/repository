
##########################################################################################
## install pyenv, pyenv_virtualenv
##########################################################################################
$ brew install pyenv pyenv_virtualenv


##########################################################################################
## setting environment
##########################################################################################
$ vi ~/.zshrc
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# virtualenv path
# /Users/user/.pyenv/versions

$ source ~/.zshrc


##########################################################################################
## install other python version
##########################################################################################
# search python version to install
$ pyenv install --list | grep python

# install specific python version in pyenv
$ pyenv install 3.12.0

# uninstall specific python version in pyenv
$ pyenv uninstall 3.12.0

# search installed virtual python and virtual-dir
$ pyenv versions
or
$ ls -l /Users/user/.pyenv/versions

# set default to specific python version
$ pyenv global 3.12.0


##########################################################################################
## create virtualenv
## pyenv virtualenv [python_version] [virtual_name]
##########################################################################################
$ pyenv virtualenv 3.12.0 py312pandas


##########################################################################################
## search virtual_names
##########################################################################################
$ pyenv virtualenvs
or
$ ls -l /Users/user/.pyenv/versions


##########################################################################################
## activate/deactivate virtual_name
##########################################################################################
$ pyenv active py312pandas

(py312pandas) -> $ pyenv deactivate
$

