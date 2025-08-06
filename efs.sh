#!/bin/bash

EFS () {

name="conections"


vpc="vpc-049bb6de4e6d7efa3"


AVAILABITY_ZONE="sa-east-1"

filesystem_id=$(aws efs create-file-system \
--name= "$name" \
--vpc= "$vpc" \
--availabity_zone= "$AVAILABITY_ZONE" \
--dns= "DNS" \
--query 'FileSystemId' --output text) 

echo "EFS FileSystemId: $filesystem_id"

sudo apt update -y
sudo apt install -y nfs-common
sudo mkdir -p /mnt/efs
sudo mkdir -p /mnt/efs/ubuntu
sudo mount -t nfs -o nfsvers=4.1 fs-XXXXXX.efs.us-east-1.amazonaws.com:/ /mnt/efs/ubuntu


}

EFS

