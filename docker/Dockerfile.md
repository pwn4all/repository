# &#35; Dockerfile
Docker can <strong><u>build, generate, create images automatically</u></strong> by reading the instructions from a Dockerfile.

#### &#42; Dockerfile manual : <https://docs.docker.com/engine/reference/builder/>

* * *
#### &#42; options of images : <https://hub.docker.com/_/mysql/>

* * *
#### 1. three steps to running containers
#### step-1) Dockerfile for example
```bash
FROM centos:7

#User
USER root

# utils
RUN yum install -y vim
RUN yum install -y net-tools

# python3.6
#RUN yum update -n

RUN yum install -y https://repo.ius.io/ius-release-el7.rpm
RUN yum install -y python36u python36u-libs python36u-devel python36u-pip

RUN pip3 install flask
RUN pip3 install pymysql
RUN pip3 install requests


# working directory
RUN mkdir -p /usr/local/myApp

COPY app.py /usr/loal/myApp

CMD /bin/bash

EXPOSE 11111
```

#### step-2) build/make/generate/create image using Dockerfile
#### * format : docker build [options] .
```bash
$ docker build -t testos .
[+] Building 77.8s (17/17) FINISHED
 => [internal] load build definition from Dockerfile                                                                          0.0s
 => => transferring dockerfile: 565B                                                                                          0.0s
 => [internal] load .dockerignore                                                                                             0.0s
 => => transferring context: 2B                                                                                               0.0s
 => [internal] load metadata for docker.io/library/centos:7                                                                   2.2s
 => [auth] library/centos:pull token for registry-1.docker.io                                                                 0.0s
 => [1/8] FROM docker.io/library/centos:7@sha256:0f4ec88e21daf75124b8a9e5ca03c37a5e937e0e108a255d890492430789b60e           0.0s
 => => resolve docker.io/library/centos:7@sha256:0f4ec88e21daf75124b8a9e5ca03c37a5e937e0e108a255d890492430789b60e             0.0s
 => CACHED [ 2/12] RUN yum install -y vim                                                                                     0.0s
 => [2/8] RUN yum install -y net-tools                                                                                      1.6s
 => [3/8] RUN yum install -y https://repo.ius.io/ius-release-el7.rpm                                                        3.0s
 => [4/8] RUN yum install -y python36u python36u-libs python36u-devel python36u-pip                                        28.5s
 => [5/8] RUN pip3 install flask                                                                                           10.8s
 => [6/8] RUN pip3 install pymysql                                                                                          2.8s
 => [7/8] RUN pip3 install requests                                                                                         5.9s
 => [8/8] RUN mkdir -p /usr/local/myApp                                                                                     0.3s
 => exporting to image                                                                                                        2.2s
 => => exporting layers                                                                                                       2.2s
 => => writing image sha256:895d6e50e0158123756db2a68c2f5e7c716baba4f64fb6a7ec85e1b6e7d4d600                                  0.0s
 => => naming to docker.io/library/testos
 
 $ docker images testos
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
testos       latest    895d6e50e015   13 minutes ago   943MB
```

#### step-3) run container
#### * format : docker run [options] imageName[:version]
```bash
$ docker run -it -d --name centapp -h centapp -p 11111:11111 testos
e48cd714d34eb3e81a6ca501feffd72b0750b9bec6f250316789287d9da468a0
$ docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED             STATUS          PORTS                                 NAMES
e48cd714d34e   testos      "/bin/sh -c /bin/bash"   5 seconds ago       Up 4 seconds    11111/tcp, 0.0.0.0:11111->11111/tcp   centapp

$ docker exec -it centapp /bin/bash
[root@centapp /]# python3 -V
Python 3.6.8
[root@centapp /]# python3 -c "print('hello python3')"
hello python3
[root@centapp /]#
```


#### &#42; build option
```bash
$ docker help build

Usage:  docker build [OPTIONS] PATH | URL | -

Build an image from a Dockerfile

Options:
      --add-host list           Add a custom host-to-IP mapping (host:ip)
      --build-arg list          Set build-time variables
      --cache-from strings      Images to consider as cache sources
      --disable-content-trust   Skip image verification (default true)
  -f, --file string             Name of the Dockerfile (Default is 'PATH/Dockerfile')
      --iidfile string          Write the image ID to the file
      --isolation string        Container isolation technology
      --label list              Set metadata for an image
      --network string          Set the networking mode for the RUN instructions during build (default "default")
      --no-cache                Do not use cache when building the image
  -o, --output stringArray      Output destination (format: type=local,dest=path)
      --platform string         Set platform if server is multi-platform capable
      --progress string         Set type of progress output (auto, plain, tty). Use plain to show container output (default "auto")
      --pull                    Always attempt to pull a newer version of the image
  -q, --quiet                   Suppress the build output and print image ID on success
      --secret stringArray      Secret file to expose to the build (only if BuildKit enabled): id=mysecret,src=/local/secret
      --ssh stringArray         SSH agent socket or keys to expose to the build (only if BuildKit enabled) (format: default|<id>[=<socket>|<key>[,<key>]])
  -t, --tag list                Name and optionally a tag in the 'name:tag' format
      --target string           Set the target build stage to build.
```
