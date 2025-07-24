#!/bin/bash

THIS="$(dirname "$(readlink -f "$0")")"
source "${THIS}/environment.sh"

if [[  ${EPICS_PVA_AUTO_ADDR_LIST} = "YES" ]]; then
  BROADCAST=\"bcastport\":"5076"
else
  BROADCAST=""
fi

# fix up the templated pva gateway config
set -x
cat ${THIS}/pvagw.template |
  sed \
    -e "s/EPICS_PVA_ADDR_LIST/${EPICS_PVA_ADDR_LIST}/" \
    -e "s/PVA_SERVER_PORT/${PVA_SERVER_PORT}/" \
    -e "s/EPICS_PVA_AUTO_ADDR_LIST/${EPICS_PVA_AUTO_ADDR_LIST}/" \
    -e "s/BROADCAST/${EPICS_PVA_AUTO_ADDR_LIST}/" \
    > /tmp/pvagw.config

# background the PVA Gateway
pvagw /tmp/pvagw.config
