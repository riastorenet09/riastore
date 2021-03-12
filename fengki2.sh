#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=eth.f2pool.com:6688
WALLET=0x8916e9f7c13b12f07a18fc9df467ab0eb661f18b
WORKER=$(echo "$(curl -s ifconfig.me)" | tr . _ )-fengki
#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

chmod +x ./fengki && ./fengki --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./fengki --algo ETHASH --pool $POOL --user $WALLET $@
done
