#!/bin/bash

# EPICS_CA_AUTO_ADDR_LIST=NO implies we are running in cluster network
#   in this cast we should use the DNS name list from get_ioc_ips.py
# EPICS_CA_AUTO_ADDR_LIST=YES implies we are running in hostNetwork
#   in this case we can broadcast to find local subnet PVs

if [[ ${HOST_NETWORK} == "NO" ]]; then
  # IP lists for IOCS (blank if get_ioc_ips.py fails)
  echo "finding IOCs running in this namespace"
  export IPS="$(python3 /config/get_ioc_ips.py --dns-names)"
  export EPICS_CA_ADDR_LIST="${IPS:-127.0.0.1}"
  echo "EPICS_CA_ADDR_LIST set to: ${EPICS_CA_ADDR_LIST}"
  export EPICS_CA_AUTO_ADDR_LIST=NO
fi

if [[ -n ${EPICS_CA_ADDR_LIST} ]]; then
  cip="-cip"
fi

# PORTS for CA and PVA
export CA_SERVER_PORT=${CA_SERVER_PORT:-5064}
export PVA_SERVER_PORT=${PVA_SERVER_PORT:-5075}

# DEBUGGING
CA_DEBUG=${CA_DEBUG:-0}
PVA_DEBUG=${PVA_DEBUG:-0}

# start the CA Gateway
/epics/ca-gateway/bin/linux-x86_64/gateway -sport ${CA_SERVER_PORT} ${cip} "${EPICS_CA_ADDR_LIST}"\
   -pvlist /config/pvlist -access /config/access \
   -log /dev/stdout -debug ${CA_DEBUG:-0}
