#!/bin/bash

# Init 
ID_EPISODE=1
DIR_NUMBER=`ls -d */ | wc -l`
SAISON=$1

echo "SAISON = ${SAISON}"

while [ $DIR_NUMBER -ge 1 ]
do
	DIR_NAME=`ls -d */ | head -1` 
	cd "${DIR_NAME}"
	
	echo "Process ${DIR_NAME} ..."
	PART_NUMBER=`ls | wc -l`
	while [ $PART_NUMBER -ge 1 ]
	do
		# Ajout du 0 devant si besoin
		[ "$ID_EPISODE" -lt 10 ] && EPISONE_NEWNAME="Doctor Who Classic - S${SAISON}E0${ID_EPISODE}.mp4" || EPISONE_NEWNAME="Doctor Who Classic - S${SAISON}E${ID_EPISODE}.mp4"
		# Recuperation des noms
		EPISODE_OLDNAME=`ls | head -1`
		# Renomage
		echo "	Renomage : ${EPISODE_OLDNAME} -> ${EPISONE_NEWNAME}"
		mv "${EPISODE_OLDNAME}" "${EPISONE_NEWNAME}"
		mv "${EPISONE_NEWNAME}" ../
	
		((ID_EPISODE=ID_EPISODE+1))
		((PART_NUMBER=PART_NUMBER-1))
	done
	
	cd ../
	echo "DONE ${DIR_NAME}"
	rm -d "${DIR_NAME}"
	((DIR_NUMBER=DIR_NUMBER-1))
	
done

