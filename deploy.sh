#!/bin/bash

vagrant halt
vagrant destroy
vagrant up
vagrant ssh --command /vagrant/extra_provision.sh

rm package*.box
vagrant package

new_file="package-$(date -I).box"
mv package.box $new_file
echo "Create $new_file"

s3cmd put --acl-public $new_file s3://vagrant-enpit
