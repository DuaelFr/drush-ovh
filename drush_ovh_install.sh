#!/bin/bash

# Download drush
wget https://github.com/drush-ops/drush/archive/6.4.0.tar.gz
# Unpack it
tar xvzf 6.4.0.tar.gz
# Rename it
mv drush-6.4.0 drush
# Clean
rm 6.4.0.tar.gz

# Download complementary files
if [ ! -f .drush_bashrc ]
then
  wget https://raw.githubusercontent.com/DuaelFr/drush-ovh/master/.drush_bashrc
fi
if [ ! -f drush_prepend.php ]
then
  wget https://raw.githubusercontent.com/DuaelFr/drush-ovh/master/drush_prepend.php
fi

# Add .drush_bashrc call in .bashrc
if grep -Fxq ".drush_bashrc" .bashrc
then
  echo ".drush_bashrc file already referenced in .bashrc"
else
  echo "" >> .bashrc
  echo "source .drush_bashrc" >> .bashrc
fi

# Reload conf
source .bashrc
