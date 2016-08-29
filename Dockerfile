FROM openshift/base-centos7

MAINTAINER Christoph Raaflaub <raaflaub@puzzle.ch>

ADD index.html /tmp/index.html

# output build dir
RUN sed -i "s|BUILD_DIR|$PWD|g" /tmp/index.html && echo "dir: $PWD"

# output build env
RUN env

# wait some seconds to enable container inspection from outside
RUN sleep 300

EXPOSE 8080

WORKDIR /tmp

CMD ["/usr/bin/python", "-m", "SimpleHTTPServer", "8080"]
