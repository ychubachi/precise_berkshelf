#!/bin/bash
vagrant halt
vagrant destroy
vagrant up

rm package.box
vagrant package

s3cmd put --acl-public package.box s3://vagrant-enpit
