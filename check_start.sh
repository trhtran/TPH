#!/bin/bash

if [ -z "`env | grep MY_HADOOP_HOME`" ]
then
	echo "La variable d'environnement MY_HADOOP_HOME n'est pas définie"
	exit 1
fi


for daemon in namenode datanode secondarynamenode resourcemanager nodemanager
do
	tmp=`ps aux | grep "_$daemon " | sed -e "s/\(^.*grep.*$\)//" | sed '/^$/d'`
	if [ "$tmp" = "" ]
	then
		echo "!!!!!!!!!!!!!!!!!!!!!! $daemon ne fonctionne pas !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		echo "Pour plus d'informations : cat $MY_HADOOP_HOME/logs/*-$daemon-*.log "
		exit 1
	fi
	
done

echo "Bravo, tout a l'air de fonctionner :)"

exit 0
