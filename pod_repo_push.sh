#!/bin/bash

#当前脚本目录
CURRENT_DIR=$(cd `dirname $0`; pwd)
echo $CURRENT_DIR
cd $CURRENT_DIR

function readConfigValue()
{
	File=$1
	KEY=$2
	VALUE=`sed "/^[ 	]*$KEY[ 	]*=/!d;s/.*=[ 	]*[\"]*//;s/[\"].*//;s/'//;s/'//" $File`
	echo $VALUE
}

PROJECT_FILE=$(ls | grep podspec | awk -F.podspec '{print $1}')
REPONAME=$(pod repo | grep -B 2 'Specs.git'| sed -n '1p')

if [ $? -eq 0 ]; then
	FEAMWORK_VERSION=`readConfigValue ${CURRENT_DIR}/${PROJECT_FILE}.podspec s.version`
	echo $FEAMWORK_VERSION
	git tag -d ${FEAMWORK_VERSION}
	git push -d origin ${FEAMWORK_VERSION}

	git tag -a ${FEAMWORK_VERSION} -m "version ${FEAMWORK_VERSION}"

	git push origin ${FEAMWORK_VERSION}:${FEAMWORK_VERSION}
	if [ $? -eq 0 ]; then
		touch .swift-version
		echo "3.0" > .swift-version
        pod trunk push ${PROJECT_FILE}.podspec --allow-warnings
	fi
else
	echo 'tag fail!!!'
	exit -1
fi

