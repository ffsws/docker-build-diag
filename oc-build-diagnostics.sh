#!/bin/sh

build_name=`oc start-build docker-build-diag`
oc describe build $build_name
oc get build $build_name -o json

build_pod=$build_name"-build"

oc describe pod $build_pod
oc env pod $build_pod --list

while : ; do

  oc rsh $build_pod

  if [ $? -eq 0 ] ; then
    exit 0;
  fi

  sleep 1
done

sleep 10

echo "build process dir: `readlink -f /proc/1/cwd`"

echo "build dir content: `ls -l /tmp/docker-*`"

echo "env"
env
