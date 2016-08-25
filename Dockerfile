FROM openshift/base-centos7

MAINTAINER Christoph Raaflaub <raaflaub@puzzle.ch>

# install jq
RUN yum install -y jq && \
    yum clean all

ADD index.txt /tmp/index.txt

# output build dir
RUN echo "dir: `pwd`" >> /tmp/index.txt && echo "dir: `pwd`"

# output dir content
RUN ls -l

# output build env
RUN env

RUN echo $BUILD

# pretty print of BUILD param
RUN echo $BUILD | jq .

EXPOSE 8080

WORKDIR /tmp

CMD ["/usr/bin/python", "-m", "SimpleHTTPServer", "8080"]

