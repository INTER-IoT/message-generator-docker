#!/bin/bash
echo "Creating named volumes for templates and SSL certificates..."
docker volume rm -f generator-templates > /dev/null 2>&1
docker volume rm -f generator-certs > /dev/null 2>&1
docker volume create generator-templates
docker volume create generator-certs
echo "Populating volumes"
docker run -v generator-templates:/data --name helper busybox true
docker cp templates helper:/data
docker rm helper
docker run -v generator-certs:/data --name helper busybox true
docker cp ${SSL}/${CKS} helper:/data
docker cp ${SSL}/${CTS} helper:/data
docker rm helper
echo "Volumes ready to be used"

