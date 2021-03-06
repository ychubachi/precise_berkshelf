#!/bin/bash

vagrant halt
vagrant destroy -f
vagrant up
vagrant ssh --command /vagrant/extra_provision.sh

rm package*.box
vagrant package

new_file="package_$(date +%Y-%m-%d_%H-%M).box"
mv package.box $new_file
echo "Create $new_file"

s3cmd put --acl-public $new_file s3://vagrant-enpit
