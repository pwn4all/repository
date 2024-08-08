$ vi /etc/yum.repos.d/CenOS-Base.repo

[base]
name=CentOS-$releasever - Base
baseurl=http://mirror.kakao.com/centos/$releasever/os/$basearch/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#released updates
[updates]
name=CentOS-$releasever - Updates
# kakao
baseurl=http://mirror.kakao.com/centos/$releasever/updates/$basearch
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#additional packages that may be useful
[extras]
name=CentOS-$releasever - Extras
baseurl=http://centos.mirror.cdnetworks.com/$releasever/extras/$basearch
gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#additional packages that extend functionality of existing packages
[centosplus]
name=CentOS-$releasever - Plus
baseurl=http://centos.mirror.cdnetworks.com/$releasever/centosplus/$basearch
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#contrib - packages by Centos Users
[contrib]
name=CentOS-$releasever - Contrib
baseurl=http://centos.mirror.cdnetworks.com/$releasever/contrib/$basearch
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

$ yum clean all
$ yum repolist

$ yum update
