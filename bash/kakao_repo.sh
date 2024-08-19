$ vi /etc/yum.repos.d/CenOS-Base.repo
##############################################################################
[kakao-base]
name=kakao - Base
baseurl=http://mirror.kakao.com/centos/$releasever/os/$basearch/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

[kakao-updates]
name=kakao - Updates
baseurl=http://mirror.kakao.com/centos/$releasever/updates/$basearch
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
 
[kakao-extras]
name=kakao - Extras
baseurl=http://mirror.kakao.com/centos/$releasever/extras/$basearch
gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
 
[kakao-centosplus]
name=kakao - Plus
baseurl=http://mirror.kakao.com/centos/$releasever/centosplus/$basearch
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

##############################################################################

$ yum clean all
$ yum repolist

$ yum update
