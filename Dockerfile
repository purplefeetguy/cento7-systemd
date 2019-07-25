FROM centos:latest

MAINTAINER "purplefeetguy" <purplefeetguy@hotmail.com>

ENV container docker

#RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# normal updates, tools, nginx, cleanup
RUN yum -y update \
 && yum -y install epel-release iproute crontabs \
# && yum -y install nginx \
&& yum -y clean all
# && yum clean all \
# && rm -rf /etc/localtime \
# && ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime

EXPOSE 80
EXPOSE 443

# COPY config/nginx.conf /etc/nginx/

#RUN systemctl enable nginx \
# && systemctl enable crond
RUN systemctl enable crond

CMD ["/usr/sbin/init"]