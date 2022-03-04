#!/usr/bin/env bash

EB_APP_STAGING_DIR=$(/opt/elasticbeanstalk/bin/get-config container -k app_staging_dir)
EB_SCRIPT_DIR=$(/opt/elasticbeanstalk/bin/get-config container -k script_dir)
. $EB_SCRIPT_DIR/use-app-ruby.sh

cd $EB_APP_STAGING_DIR
echo "Installing compatible bundler"
gem install bundler -v 2.2.32

