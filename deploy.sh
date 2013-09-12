#!/bin/bash
rm package.box
vagrant package
s3cmd put package.box s3://vagrant-enpit
