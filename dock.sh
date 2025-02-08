#!/bin/bash

cmds=()
IFS=$'\n'
for l in `cat dock.dat`
do
    path=`echo ${l} | cut -d$'\t' -f 2 | sed -e 's/file:\/\///' | sed -e 's/%20/\ /g'`
	location=`echo ${l} | cut -d$'\t' -f 3`
	if [ ${location} == 'persistentApps' ]
	then
	    location='apps'
	elif [ ${location} == 'recentApps' ] || [ ${location} == 'persistentOthers' ]
	then
	    location='others'
	else
	    continue
	fi
	cmds+=("docutil --add '${path}' --section ${location} --no-restart")
done

set -x
dockutil --remove all --no-restart
for c in ${cmds[@]}
do
    bash -c ${c}
done
set +x
