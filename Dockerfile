FROM centos

MAINTAINER Julian Bäume <julian.baeume@svg4all.de>

EXPOSE 53/udp
EXPOSE 53
EXPOSE 8081

RUN yum -y update &&\
    yum -y install epel-release &&\
    yum -y install pdns pdns-backend-sqlite &&\
    yum clean all

COPY ["setup.sql", "/setup.sql"]
COPY ["pdns.conf", "/etc/pdns/pdns.conf"]
COPY ["entrypoint.sh", "/entrypoint.sh"]
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
