CONTAINER_PREFIX=uveats
WEB_CONTAINER_NAME=`docker container ls | grep ${CONTAINER_PREFIX}_web_run_ | sed -E -e "s/^.+( +)([^ ]+)$/\2/"`
docker exec -it ${WEB_CONTAINER_NAME} bash
