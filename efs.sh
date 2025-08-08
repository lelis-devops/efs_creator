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

#Installation for ubuntu
sudo apt update -y
sudo apt install -y nfs-common
sudo mkdir -p /mnt/efs
sudo mkdir -p /mnt/efs/ubuntu
sudo mount -t nfs -o nfsvers=4.1 fs-XXXXXX.efs.us-east-1.amazonaws.com:/ /mnt/efs/ubuntu

#Installation for amazon linux
sudo yum install -y amazon-efs-utils
sudo mkdir -p /mnt/efs
sudo mkdir -p /mnt/efs/amazonlinux
sudo mount -t efs fs-XXXXXX:/ /mnt/efs/amazonlinux
echo "fs-XXXXXX:/ /mnt/efs/amazonlinux efs _netdev,tls 0 0" | sudo tee -a /etc/fstab

}

EFS

