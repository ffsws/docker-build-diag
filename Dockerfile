FROM openshift/base-centos7

MAINTAINER Christoph Raaflaub <raaflaub@puzzle.ch>

ADD index.txt /tmp/index.txt

EXPOSE 8080

WORKDIR /tmp

CMD ["/usr/bin/python", "-m", "SimpleHTTPServer", "8080"]

