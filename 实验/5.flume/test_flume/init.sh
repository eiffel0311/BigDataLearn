#!/bin/bash

FLUME_PATH=/opt/test/flume/apache-flume-1.6.0-cdh5.13.3-bin/bin/flume-ng
AGENT_NAME=""
CONF_FILE="" 
PWD_CURRENT=$(cd $(dirname $0) ; pwd)
CONF_FILE="$PWD_CURRENT/flume-conf.properties"

error() {
  local msg=$1
  local exit_code=$2

  echo "Error: $msg" >&2

  if [ -n "$exit_code" ] ; then
    exit $exit_code
  fi
}

if ! which jps > /dev/null 2>&1 ; then
  error "jps is not in search path, please check" 1
fi

if [[ -f "$CONF_FILE" ]] ; then
  AGENT_NAME=$(basename "$PWD_CURRENT")
else
  error "flume-conf.properties not found in dir $CONF_FILE" 
fi

proc_id=$(jps -ml | grep no-reload-conf | grep "\<$AGENT_NAME\>$" | cut -d ' ' -f 1)
start_agent() {
  if [[ ! -z $proc_id ]] ; then
    error "process $proc_id is running, stop it first" 1
  fi
  echo "starting agent $AGENT_NAME"
  nohup ${FLUME_PATH} agent --conf ${PWD_CURRENT} --conf-file ${CONF_FILE} --no-reload-conf --name ${AGENT_NAME} > $PWD_CURRENT/init.out 2>&1 &
  echo ${FLUME_PATH} agent --conf ${PWD_CURRENT} --conf-file ${CONF_FILE} --no-reload-conf --name ${AGENT_NAME} 
}

stop_agent() {
  if [[ -z $proc_id ]] ; then
    error "agent is not running" 1
  fi
  echo "stopping agent $AGENT_NAME , if this doesn't work, please use kill -9 $proc_id"
  kill $proc_id
}

agent_status() {
  if [[ -z $proc_id ]] ; then
    echo "agent $AGENT_NAME is not running"
  else
    echo "agent $AGENT_NAME process $proc_id is running"  
  fi
}

agent_metrics() {
  local port=$(grep HTTP_MONITORING_PORT= $PWD_CURRENT/flume-env.sh | awk -F '=' '{print $2}')

  procid=$(lsof -i:${port:-0} | grep LISTEN | awk '{print $2}')
  if [[ $procid != $proc_id ]] ; then
    echo agent $proc_id is not listening on port $port as expected, please check it first
    exit 1
  fi

  curl 127.0.0.1:$port/metrics
}

display_help() {
  cat <<EOF

Usage: $0 <command>

commands:
  help                      display this help text
  start                     run a Flume agent
  stop                      stop a Flume agent(kill -9)
  status                    show Flume Running status
  metrics                   show http metrics, if there is any

EOF
}

cmd=""
while [ -n "$*" ] ; do
  arg=$1
  shift

  case "$arg" in
    start|status|stop|metrics|help)
      [ -z $cmd ] || error "multi command detected, please use only one command" 1
      cmd="$arg"
      ;;      
    *)
      error "wrong command, supported command is start|stop|status|help" 1
      ;;
  esac
done

case "$cmd" in
  help)
    display_help
    exit 0
    ;;
  start)
    start_agent
    ;;
  stop)
    stop_agent
    ;;
  status)
    agent_status
    exit 0
    ;;
  metrics)
    agent_metrics
    exit 0
    ;;
  *)
    error "Unknown or unspecified command '$cmd'"
    echo
    display_help
    exit 1
    ;;
esac

exit 0
