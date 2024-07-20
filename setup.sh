#!/usr/bin/bash

#docker import https://github.com/rocky-linux/sig-cloud-instance-images/raw/Rocky-8.6.20220515-x86_64-Minimal/Rocky-8-Container-x86_64-Minimal.tar.xz rocky-8.6-minimal
docker import https://github.com/rocky-linux/sig-cloud-instance-images/raw/Rocky-8.6.20220515-x86_64-Base/Rocky-8-Container-x86_64-Base.tar.xz rocky-8.6

docker buildx build -t drrocky .
