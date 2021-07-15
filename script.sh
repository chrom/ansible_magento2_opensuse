#!/bin/bash
cd ~/project
git init -qqq
git remote add origin https://github.com/markshust/docker-magento
git fetch origin -qqq
git checkout origin/master -- compose
mv compose/* ./
mv compose/.gitignore ./
mv compose/.vscode ./
rm -rf compose .git
git init

DOMAIN=${1:-magento.test}
VERSION=${2:-2.4.2}
EDITION=${3:-community}

sudo bin/download magento.test community \
  && echo "Your system password has been requested to add an entry to /etc/hosts..." \
  && echo "127.0.0.1 ::1 magento.test" | sudo tee -a /etc/hosts \
  && bin/setup magento.test
