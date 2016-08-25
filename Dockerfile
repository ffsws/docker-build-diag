FROM openshift/base-centos7

MAINTAINER Christoph Raaflaub <raaflaub@puzzle.ch>

# output build dir
RUN echo 'build dir:'
RUN pwd

# output dir content
RUN echo 'build dir content:'
RUN ls -l

# output build env
RUN echo 'build env:'
RUN env

ADD index.txt /tmp/index.txt

EXPOSE 8080

WORKDIR /tmp

CMD ["/usr/bin/python", "-m", "SimpleHTTPServer", "8080"]

