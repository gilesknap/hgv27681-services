#!/bin/bash

THIS_DIR="$(dirname "$(readlink -f "$0")")"

source "${THIS_DIR}/environment.sh"

if [[ -n ${EPICS_CA_ADDR_LIST} ]]; then
  cip="-cip"
  addrlist=\"${EPICS_CA_ADDR_LIST}\"
fi
# start the CA Gateway
set -x
/epics/ca-gateway/bin/linux-x86_64/gateway -sport ${CA_SERVER_PORT} ${cip} ${addrlist} \
   -pvlist /config/pvlist -access /config/access \
   -log /dev/stdout -debug ${CA_DEBUG:-0}
