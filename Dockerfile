FROM centos

MAINTAINER Julian Bäume <julian.baeume@svg4all.de>

EXPOSE 53/udp
EXPOSE 53
EXPOSE 8081
EXPOSE 8082

VOLUME /data

RUN yum -y update &&\
    yum -y install epel-release yum-plugin-priorities &&\
    curl -o /etc/yum.repos.d/powerdns-auth-master.repo https://repo.powerdns.com/repo-files/centos-auth-master.repo &&\
    curl -o /etc/yum.repos.d/powerdns-rec-master.repo https://repo.powerdns.com/repo-files/centos-rec-master.repo &&\
    yum -y install pdns pdns-backend-sqlite pdns-recursor &&\
    yum clean all

COPY ["setup.sql", "/setup.sql"]
COPY ["pdns.conf", "/etc/pdns/pdns.conf"]
COPY ["recursor.conf", "/etc/pdns-recursor/recursor.conf"]
COPY ["entrypoint.sh", "/entrypoint.sh"]
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
