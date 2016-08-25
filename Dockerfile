FROM openshift/base-centos7

MAINTAINER Christoph Raaflaub <raaflaub@puzzle.ch>

# install jq
RUN yum install -y jq && \
    yum clean all

ADD index.html /tmp/index.html

# output build dir
RUN sed -i "s|BUILD_DIR|$PWD|g" /tmp/index.html && echo "dir: $PWD"

# output dir content
RUN echo `ls -l` > tmp.txt
RUN sed -i "s/BUILD_DIR_CONTENT/$(cat tmp.txt)/" /tmp/index.html && ls -l
RUN rm tmp.txt

# output build env
RUN env

RUN echo $BUILD

# pretty print of BUILD param
RUN echo $BUILD | jq .

EXPOSE 8080

WORKDIR /tmp

CMD ["/usr/bin/python", "-m", "SimpleHTTPServer", "8080"]

