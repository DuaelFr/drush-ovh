#!/bin/bash

# Download drush if needed
if [ ! -d drush ]
then
  # Download
  wget https://github.com/drush-ops/drush/archive/6.4.0.tar.gz
  # Unpack
  tar xvzf 6.4.0.tar.gz
  # Rename
  mv drush-6.4.0 drush
  # Clean
  rm 6.4.0.tar.gz
fi

# Download complementary files if needed
if [ ! -f .drush_bashrc ]
then
  wget https://raw.githubusercontent.com/DuaelFr/drush-ovh/master/.drush_bashrc
fi
if [ ! -f drush_prepend.php ]
then
  wget https://raw.githubusercontent.com/DuaelFr/drush-ovh/master/drush_prepend.php
fi

# Add .drush_bashrc call in .bashrc if needed
if ! grep -Fxq ".drush_bashrc" .bashrc
then
  echo "" >> .bashrc
  echo "source .drush_bashrc" >> .bashrc
fi

# Reload conf
source .bashrc
