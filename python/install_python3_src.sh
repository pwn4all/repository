#################################################################################
## install python3.9.tgz
#################################################################################
## download python3.9
## ------------------------------------------------------------------------
$ wget https://www.python.org/ftp/python/3.9.0/Python-3.9.0.tgz

$ tar -zxvf Python-3.9.0.tgz

## ------------------------------------------------------------------------
# install or download rpm packages about compile
$ mkdir /home/user/python3.9_pkgs
$ sudo yum install gcc openssl-devel bzip2-devel libffi-devel zlib-devel --downloadonly --downloaddir=/home/user/python3.9_pkgs
$ sudo yum install /home/user/python3.9_pkgs/*.rpm

## ------------------------------------------------------------------------
$ cd Python-3.9.0
$ ./configure && make && make test && sudo make install


#################################################################################
## remove python3.tgz
## manually remove when it not work command(sudo make uninstall)
#################################################################################
$ sudo rm -rf ~/.local/lib/python3.9/


# remove about python3 using unlink and rm command
## ------------------------------------------------------------------------
$ ls /usr/local/bin
2to3      2to3-3.9          easy_install-3.9  idle3.8  pip3    pip3.9  pydoc3.8  python3    python3.8-config  python3.9-config
2to3-3.8  easy_install-3.8  idle3             idle3.9  pip3.8  pydoc3  pydoc3.9  python3.8  python3.9         python3-config

$ cd /usr/local/bin
$ sudo rm -rf ./* 


## ------------------------------------------------------------------------
$ ll /usr/local/lib
total 28196
-r-xr-xr-x.  1 root root 28859704 Apr 12 08:55 libpython3.9m.a
drwxr-xr-x.  2 root root       67 Apr 12 08:55 pkgconfig
drwxr-xr-x. 35 root root     8192 Apr 12 08:55 python3.9

$ cd /usr/local/lib
$ sudo rm -rf libpython3.9m.a pkgconfig/ python3.9/


## ------------------------------------------------------------------------
$ ll /usr/local/share/man/man1
total 16
lrwxrwxrwx. 1 root root    11 Apr 12 08:55 python3.9 -> python3.9.0
-rw-r--r--. 1 root root 13634 Apr 12 08:55 python3.9.0

$ cd /usr/local/share/man/man1
$ sudo unlink python3.9
$ sudo rm python3.9.0 


## ------------------------------------------------------------------------
$ ll /usr/local/include/
total 4
drwxr-xr-x. 2 root root 4096 Apr 12 08:55 python3.9m

$ cd /usr/local/include/
$ sudo rm -rf python3.9m/
