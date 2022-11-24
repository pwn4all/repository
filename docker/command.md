# &#35; commands of docker usage

#### &#42; Docker manual : <https://docs.docker.com/engine/reference/commandline/docker/>
#### &#42; help usage
```bash
docker help

docker help container
docker help container port
docker help cp
docker help container cp

docker container --help
docker container port --help
docker cp --help
docker container cp --help
```

* * *
#### 1-1. one step to running containers
#### a) download image (if image not exists local)
#### b) create conatiner
#### c) run container
#### * format : docker run [options] imageName[:version]
#### * port : -p local_port:container_port
#### * port range : -p 28000-29000:8000-9000
```bash
docker run -it --name myDebian -h webDebian -p 80:80 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-pwd -e MYSQL_DATABASE
=daName [--privileged] -v /local_path:container_name/remote_path devian:latest
```

#### &#42; options
```bash
-it : interactive terminal
-d  : run of daemon mode
-h  : hostname of container
-p  : port forwarding [ external port:internal port(container) ]
-e  : environment valiable
-v  : mount volume (local and container)
devian[:latest] : osName:version(image name)
```

#### &#42; options of images : <https://hub.docker.com/_/mysql/>

* * *
#### 1-2. three steps to running containers
#### 1) download image (if image not exists local)
```bash
docker pull devian:latest
```

#### 2) create container
#### * format : docker create [options] imageName[:version]
#### * port : -p local_port:container_port
#### * port range : -p 28000-29000:8000-9000
```bash
docker create -it --name myDebian -h webDebian -p 80:80 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-pwd -e MYSQL_DATABASE
=daName [--privileged] -v /local_path:container_name/remote_path devian:latest
```

#### 3) run container
#### * format : docker start|stop containerName/Id
```bash
docker start myDebian
or
docker start 31e9ae301053
```

* * *
#### 2. related to image
#### * image is only a unit for saving or backup or etc not container.
```bash
docker images

docker rmi imageName

docker save myDebian -o myDebian.tar
docker load -i myDebian.tar
```
* * *
#### 3. related to container
#### * container is just working unit.
#### * if you want to save or backup, must save the container as an image using commit.
```bash
docker container ls
or
docker ps [-a]

# delete one container
docker rm containerName

# delete all running container
docker rm $(docker ps -q)

# get only container's id if 4 containers runnig
# -q, --quiet           Only display container IDs
docker ps [-a] -q
31e9ae301053
12a8f4f9ce5b
fd32ea7d6776
31ec3630fb07


# export a container’s filesystem as a tar archive
docker export myDebian -o myDebian.tar
```

```bash
# from local file/directory to container
docker container cp localpath myDebian:/remotepath
or
docker cp localpath myDebian:/remotepath

# from container file/directory to local
docker container cp myDebian:/remotepath localpath
or
docker cp myDebian:/remotepath localpath
```

* * *
#### 4. local registry/repository
#### step 1 : run local registry container
```bash
docker run -d --name myRegistry -p 5000:5000 registry:latest
docker images

docker container port myRegistry [5000]
or
docker port myRegistry [5000]
```
#### step 2 : create new image(commit)
```bash
docker commit myDebian 127.0.0.1:5000/myDebian[:version]
or
[+] commit public repository
docker commit myDebian myDebian[:version]
```
#### step 3 : save/export new image
```bash
# save image to local registry/repository
docker save 127.0.0.1:5000/myDebian -o myDebian.tar
or
# save normal image
docker save myDebian -o myDebian.tar
```
#### step 4 : load new image on other system
```bash
# step 4
docker load -i myDebian.tar
docker images
```


* * *
#### 5. aslr/nx off (systemctl command)
#### step 1 : connect to docker
```bash
$ nc -U ~/Library/Containers/com.docker.docker/Data/debug-shell.sock
/ # ^[[31;5Rid
id
uid=0(root) gid=0(root)
/ # ^[[31;5R
or
$ stty -echo -icanon && nc -U ~/Library/Containers/com.docker.docker/Data/debug-shell.sock && stty sane
/ # id
uid=0(root) gid=0(root)
/ #
```

#### step 2 : apply aslr/nx off
```bash
/ # echo 0  > /proc/sys/kernel/randomize_va_space
echo 0  > /proc/sys/kernel/randomize_va_space
/ # cat /proc/sys/kernel/randomize_va_space
cat /proc/sys/kernel/randomize_va_space
0
/ #



$ docker exec -it linux bash
# cd home/
/home
# ldd ./a
    linux-gate.so.1 (0xf7fcf000)
    libc.so.6 => /lib/i386-linux-gnu/libc.so.6 (0xf7dc5000)
    /lib/ld-linux.so.2 (0xf7fd1000)
# ldd ./a
    linux-gate.so.1 (0xf7fcf000)
    libc.so.6 => /lib/i386-linux-gnu/libc.so.6 (0xf7dc5000)
    /lib/ld-linux.so.2 (0xf7fd1000)
# ldd ./a
    linux-gate.so.1 (0xf7fcf000)
    libc.so.6 => /lib/i386-linux-gnu/libc.so.6 (0xf7dc5000)
    /lib/ld-linux.so.2 (0xf7fd1000)
# 
```
