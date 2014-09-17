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
}

sortie() {
  rc=$1
  [ $SEVERITE -ne 0 ] && rc=$SEVERITE
  exit $rc
}

check_sf() {
  [ -z "$SFLIB" ] && echo " ! ShellFactory n'est pas installé ! 
  https://github.com/cchaudier/shellfactory" && exit 1
}

init
sortie 0
