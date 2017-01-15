#!/bin/bash
set -e

export CASSANDRA=${CASSANDRA:-cassandra}

export WAIT=${WAIT:-30}
echo "Waiting up to ${WAIT}s for cassandra"
int=5
iter=$((WAIT / int))
while [[ $iter -gt 0 ]]; do
  if nc -w1 ${CASSANDRA} 9160; then
    break
  fi
  sleep $((int - 1))
  iter=$((iter - 1))
done
echo "Thrift UP, waiting another 10s for Cassandra to settle"
sleep 10

exec bin/kairosdb.sh run
