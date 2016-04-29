# sqldev-docker
Run SQL Developer in a Docker container on Fedora/RHEL

## Overview
SQL Developer can act unpredictably if it is used with a version of Java
that is too high or too low. This container will install the correct version
of Java for the latest SQL Developer, and when given the SQL Developer RPM,
will install and launch it automatically.

## Defaults
* SQL Developer version: 4.1
* JDK version: 1.8.0.92

## Quick Start
If you already have Docker running on your system, the steps you should
follow are:

1. [Download the SQL Developer RPM from Oracle](http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html) -- this requires an Oracle account
2. Update the Dockerfile with the version of SQL Developer you have.
3. Put the SQL Developer RPM into the /import directory
  * You can also drop in anything you want available in your container, e.g. a connection XML file
4. Build the image from the root directory

        docker build -t sqldev .

5. Then you can run the container & auto-start SQL Developer with

        docker run -ti -v /tmp/.X11-unix/:/tmp/.X11-unix/ --rm -e DISPLAY -e TZ=GMT sqldev

## Installing Docker On Fedora, CentOS and RHEL

To install docker on Fedora and RHEL7, the following commands should work:

	sudo dnf install docker
	sudo systemctl start docker
	sudo systemctl enable docker

For older version of Fedora and RHEL6 the commands are:

	sudo yum install docker-io
	sudo service docker start
	sudo chkconfig docker on

