# sqldev-docker
Run SQL Developer in a Docker container

## Overview
SQL Developer can act unpredictably if it is used with a version of Java
that is too high or too low. This container will install the correct version
of Java for the latest SQL Developer, and when given the SQL Developer RPM,
will install and launch it automatically.

## Quick Start
If you already have Docker running on your system, the steps you should
follow are:

1. [Download the SQL Developer RPM from Oracle](http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html) -- this requires an Oracle account
2. Put the SQL Developer RPM into the /rpm directory
3. Build the image from the root directory

        docker build -t sqldev .

4. Then you can run the container & auto-start SQL Developer with

        docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix sqldev bin/bash

5. Once you have the bash prompt up, enter the following command to load SQL Developer

        echo "/usr/java/jdk1.8.0_92/" | sqldeveloper

## Installing Docker On Fedora, CentOS and RHEL

To install docker on Fedora and RHEL7, the following commands should work:

	sudo dnf install docker
	sudo systemctl start docker
	sudo systemctl enable docker

For older version of Fedora and RHEL6 the commands are:

	sudo yum install docker-io
	sudo service docker start
	sudo chkconfig docker on

