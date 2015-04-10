#!/bin/bash
# Install terraform.io

#Chargement des bibliothèques
charge_libs() {
  libs="log std"
  for lib in $libs; do
    . ${SFLIB}/${lib}.lib || erreur "Chargmenent de la bibliothèque [$lib] : impossible "
    sflib_log_debug "Chargmenent de la bibliothèque [$lib] : OK"
    sflib_${lib}_init || "Initialisation de la bibliothèque [$lib] : impossible "
    sflib_log_debug "Initialisation de la bibliothèque [$lib] : OK"
  done
}

init() {
  check_sf
  charge_libs
  dest_dir=/usr/bin
  terra_vers=0.4.1
  url_bin=https://dl.bintray.com/mitchellh/terraform/terraform_${terra_vers}_linux_amd64.zip
  wrk_dir=$(pwd)
  tmp_dir=/var/tmp/install_terraform
  sflib_std_rep_create $tmp_dir
  cd $tmp_dir
}

sortie() {
  rc=$1
  cd $wrk_dir
  sflib_std_rm $tmp_dir
  [ $SEVERITE -ne 0 ] && rc=$SEVERITE
  exit $rc
}

check_sf() {
  [ -z "$SFLIB" ] && echo " ! ShellFactory n'est pas installé ! 
  https://github.com/cchaudier/shellfactory" && exit 1
}

get_bin() {
 wget $url_bin
 unzip *
 rm *.zip
 sudo mv -f * $dest_dir
}

init
get_bin
sortie 0
