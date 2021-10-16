#!/bin/bash

# fail on error
set -e

pushd `dirname $0` > /dev/null
SCRIPT=`pwd -P`
popd > /dev/null

CONFIG=${SCRIPT}/public_html/wp-config.php


function extract_from_wpconfig() {
  cat $CONFIG | grep $1 | sed -n "s/define( *'$1', *'\([^']*\)'.*/\1/p"
}

# get credentails from wp-config.php
NAME=$(extract_from_wpconfig "DB_NAME")
PASS=$(extract_from_wpconfig "DB_PASSWORD")
DEST=../backups

echo "start mysql db backup of $NAME"
echo "dest: $FILE"

# setup backup destination if needed
if [[ ! -d $DEST ]]; then
  mkdir $DEST
  
  #### if needed
  #echo "deny from all" > ${DEST}/.htaccess 
  #### if needed

fi

mysqldump --complete-insert --routines --triggers --single-transaction -u"${NAME}" -p"${PASS}" ${NAME} | gzip > backups/${NAME}.sql.gz && echo -e "\n\n\n!!! Backup Realizado com sucesso !!! \n\n\n"