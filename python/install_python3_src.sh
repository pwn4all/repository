#################################################################################
## install python3.tgz
#################################################################################
## download python3
## ------------------------------------------------------------------------
$ curl -O https://www.python.org/ftp/python/3.8.8/Python-3.8.8.tgz
$ tar -zxvf Python-3.8.8.tgz

## ------------------------------------------------------------------------
# install or download rpm packages about compile
$ sudo yum install -y openssl openssl-devel zlib zlib-devel
or
$ mkdir /home/user/python3.8_pkgs
$ sudo yum install openssl openssl-devel zlib zlib-devel --downloadonly --downloaddir=/home/user/python3.8_pkgs

## ------------------------------------------------------------------------
$ sudo ./configure --enable-optimizations
$ sudo make && sudo make install


#################################################################################
## remove python3.tgz
## manually remove when it not work command(sudo make uninstall)
#################################################################################
$ sudo rm -rf ~/.local/lib/python3.6/

# remove about python3 using unlink and rm command
$ ll /usr/local/bin
total 22632
lrwxrwxrwx. 1 root root        8 Apr 12 08:55 2to3 -> 2to3-3.6
-rwxr-xr-x. 1 root root      101 Apr 12 08:55 2to3-3.6
-rwxr-xr-x. 1 root root      242 Apr 11 15:18 easy_install-3.6
lrwxrwxrwx. 1 root root        7 Apr 12 08:55 idle3 -> idle3.6
-rwxr-xr-x. 1 root root       99 Apr 12 08:55 idle3.6
-rwxr-xr-x. 1 root root      224 Apr 11 15:18 pip3
-rwxr-xr-x. 1 root root      224 Apr 11 15:18 pip3.6
lrwxrwxrwx. 1 root root        8 Apr 12 08:55 pydoc3 -> pydoc3.6
-rwxr-xr-x. 1 root root       84 Apr 12 08:55 pydoc3.6
lrwxrwxrwx. 1 root root        9 Apr 12 08:55 python3 -> python3.6
-rwxr-xr-x. 2 root root 11569520 Apr 12 08:55 python3.6
lrwxrwxrwx. 1 root root       17 Apr 12 08:55 python3.6-config -> python3.6m-config
-rwxr-xr-x. 2 root root 11569520 Apr 12 08:55 python3.6m
-rwxr-xr-x. 1 root root     3097 Apr 12 08:55 python3.6m-config
lrwxrwxrwx. 1 root root       16 Apr 12 08:55 python3-config -> python3.6-config
lrwxrwxrwx. 1 root root       10 Apr 12 08:55 pyvenv -> pyvenv-3.6
-rwxr-xr-x. 1 root root      441 Apr 12 08:55 pyvenv-3.6


$ sudo unlink 2to3
$ sudo unlink idle3
$ sudo unlink pydoc3
$ sudo unlink python3
$ sudo unlink python3.6-config 
$ sudo unlink python3-config 
$ sudo unlink pyvenv
$ 
$ sudo rm 2to3-3.6 easy_install-3.6 idle3.6 pip3 pip3.6 pydoc3.6 python3.6 python3.6m python3.6m-config pyvenv-3.6 




## ------------------------------------------------------------------------
## remove all file
## ------------------------------------------------------------------------
$ ll /usr/local/lib
total 28196
-r-xr-xr-x.  1 root root 28859704 Apr 12 08:55 libpython3.6m.a
drwxr-xr-x.  2 root root       67 Apr 12 08:55 pkgconfig
drwxr-xr-x. 35 root root     8192 Apr 12 08:55 python3.6

$ sudo rm -rf libpython3.6m.a pkgconfig/ python3.6/

## ------------------------------------------------------------------------
$ ll /usr/local/share/man/man1
total 16
lrwxrwxrwx. 1 root root    11 Apr 12 08:55 python3.1 -> python3.6.1
-rw-r--r--. 1 root root 13634 Apr 12 08:55 python3.6.1

$ sudo unlink python3.1 
$ sudo rm python3.6.1 


## ------------------------------------------------------------------------
$ ll /usr/local/include/
total 4
drwxr-xr-x. 2 root root 4096 Apr 12 08:55 python3.6m

$ sudo rm -rf python3.6m/
