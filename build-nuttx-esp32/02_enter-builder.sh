#!/bin/bash

if [ $(dirname $0) = . ]; then
echo "This script should be run in one directory above."
exit
fi

if [ "$#" != 1 ]; then
IMAGE_NAME="nuttx_esp32_builder"
else
IMAGE_NAME=$1
fi

USER_NAME=$(id -u -n)
GROUP_NAME=$(id -g -n)

CMD="docker run --rm -it"
CMD+=" -u ${USER_NAME}:${GROUP_NAME}"
CMD+=" -v ${PWD}:${HOME}/work"
CMD+=" -w ${HOME}/work"
CMD+=" ${IMAGE_NAME}"

echo "*******************************************"
echo "*                                         *"
echo "*   Please remember to execute 'get_idf'  *"
echo "*                                         *"
echo "*******************************************"

echo ${CMD}
${CMD}
