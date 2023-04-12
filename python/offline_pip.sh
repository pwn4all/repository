#################################################################################
## download *.whl
#################################################################################
$ mkdir virtualenv
$ pip download -d ./virtualenv virtualenv


#################################################################################
## install package using local *.whl or *.tar.gz
## link : https://pip.pypa.io/en/stable/cli/pip_install/
#################################################################################
$ python -m pip install --no-index --find-links=/home/user/virtualenv virtualenv
