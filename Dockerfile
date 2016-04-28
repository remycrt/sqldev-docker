FROM fedora:23

RUN dnf install -y wget tar file libXtst libXrender

RUN cd ~
RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u92-b14/jdk-8u92-linux-x64.rpm" -O jdk-8-linux-x64.rpm
RUN dnf install -y jdk-8-linux-x64.rpm

COPY rpm/* /root

RUN dnf install -y /root/sqldeveloper-*
