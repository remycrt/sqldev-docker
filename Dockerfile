FROM fedora:23

#Enter the major version number for your SQL Developer RPM
ENV sqldev_ver 4

#Enter the name of the auto-generated version directory under ~/.sqldeveloper
ENV sqldev_subdir 4.1.0

RUN dnf install -y wget file libXtst libXrender

RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u92-b14/jdk-8u92-linux-x64.rpm" -O jdk-linux-x64.rpm
RUN dnf install -y jdk-linux-x64.rpm

COPY import/* /root/

RUN dnf install -y /root/sqldeveloper-${sqldev_ver}*
RUN mkdir -p /root/.sqldeveloper/${sqldev_subdir}/ && echo "SetJavaHome /usr/java/latest/" > /root/.sqldeveloper/${sqldev_subdir}/product.conf

ENTRYPOINT sqldeveloper