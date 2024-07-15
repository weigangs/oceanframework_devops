#!/bin/bash

function setVmParams() {
  APP_NAME=$1
  SERVER_PORT=$2
  LOG_FILE_VM=$3
  JASYPT_SECRET_VM=$4
  PROFILE_VM=$5
  LOG_LEVEL=$6
}

function doStart() {
    echo -e "The $APP_NAME is starting...\c"
    source /etc/profile
    nohup java -Xms125M -Xmx125M -jar "$PROFILE_VM" "$JASYPT_SECRET_VM" "$LOG_FILE_VM" "$LOG_LEVEL" $APP_NAME >/dev/null 2>&1 &
    COUNT=0
    while [ $COUNT -lt 1 ]; do
      echo -e ".\c"
      sleep 3
      IS_LISTENED=$(netstat -an | grep -w LISTEN | grep -w $SERVER_PORT)
      if [ -n "$IS_LISTENED" ]; then
        COUNT=1
      fi
    done
    PIDS=$(ps -ef | grep -w $APP_NAME | grep -v grep | awk '{print $2}')
    echo ""
    echo "${APP_NAME} start success!"
    echo "PID: $PIDS"
    echo "STDOUT: $STDOUT_FILE"
}

function start() {
  # set vm params
  setVmParams $@
  count=$(ps -ef | grep java | grep $APP_NAME | wc -l)
  if [ $count != 0 ]; then
    echo "Maybe $APP_NAME is running, please check it..."
  else
    doStart
  fi

}

function status() {
  setVmParams $@
  appId=$(ps -ef | grep java | grep $APP_NAME | awk '{print $2}')
  if [ -z $appId ]; then
    echo -e "\033[31m Not running \033[0m"
  else
    echo -e "\033[32m Running [$appId] \033[0m"
  fi
}

function doStop() {
  if [ "$killForceFlag" == "-f" ]; then
    echo "by force"
    kill -9 $appId
  else
    echo
    kill $appId
  fi
}

function stop() {
  setVmParams $@
  appId=$(ps -ef | grep java | grep $APP_NAME | awk '{print $2}')
  if [ -z $appId ]; then
    echo "Maybe $APP_NAME not running, please check it..."
  else
    echo -n "The $APP_NAME is stopping..."
    doStop
    for i in {30..1}; do
      appId=$(ps -ef | grep java | grep $APP_NAME | awk '{print $2}')
      if [ -z $appId ]; then
        break
      fi
      echo -n "$i "
      if [ $i -eq 29 ]; then
        killForceFlag="-f"
        doStop
        break
      fi
      sleep 1
    done
  fi
}

function restart() {
  params=$@
  stop $params
  for i in {6..1}; do
    echo -n "$i "
    sleep 1
  done
  echo 0
  start $params
}