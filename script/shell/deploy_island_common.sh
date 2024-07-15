#!/bin/bash
source ./common_start.sh

BASE_DIR=$(
  cd $(dirname $0)
  pwd -P
)
LOG_FILE=${BASE_DIR}/logs/island-common-service.log
APP_NAME="island-common-service-1.1.1.jar"
SERVER_PORT=19081
JASYPT_SECRET_VM="-Djasypt.encryptor.password=sitsecret"
LOG_FILE_VM="-Dlogging.file=$LOG_FILE"
PROFILE_VM="-Dspring.profiles.active=sit"
LOG_LEVEL="-Dlogging.level.root=INFO"


restart $APP_NAME $SERVER_PORT $LOG_FILE_VM $JASYPT_SECRET_VM $PROFILE_VM $LOG_LEVEL