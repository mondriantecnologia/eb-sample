#!/usr/bin/env bash

EB_APP_STAGING_DIR=$(/opt/elasticbeanstalk/bin/get-config container -k app_staging_dir)
EB_SCRIPT_DIR=$(/opt/elasticbeanstalk/bin/get-config container -k script_dir)
. $EB_SCRIPT_DIR/use-app-ruby.sh

cd $EB_APP_STAGING_DIR
echo "Installing compatible node"
curl --silent --location https://rpm.nodesource.com/setup_12.x | bash -
yum -y install nodejs
wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
yum -y install yarn

bundle exec rake webpacker:install

