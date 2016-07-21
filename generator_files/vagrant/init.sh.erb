#!/bin/bash

set -e

STAGE='/tmp/magnum-vagrant-stage'
KEYFILE='/tmp/puppetlabs-gpg'

FIXTURES_DIR='/vagrant/spec/fixtures/modules'
PUPPET_MODULES_DIR='/etc/puppetlabs/code/modules'
VAGRANT_PUPPET_ENV_DIR='/tmp/vagrant-puppet/environments/vagrant'

if [ ! -e $STAGE ]; then

  echo "Initial provision, running the magnum-vagrant shell provisioner script..."

  wget -q -O $KEYFILE https://apt.puppetlabs.com/pubkey.gpg &>/dev/null
  apt-key add $KEYFILE

  apt-get update

  mkdir -p $VAGRANT_PUPPET_ENV_DIR
  ln -sfn $FIXTURES_DIR $VAGRANT_PUPPET_ENV_DIR/modules

  rm -rf $PUPPET_MODULES_DIR
  ln -sfn $VAGRANT_PUPPET_ENV_DIR/modules $PUPPET_MODULES_DIR

  touch $STAGE

else
  echo "Not initial provision, skipping the magnum-vagrant shell provisioner script..."
fi

exit 0
