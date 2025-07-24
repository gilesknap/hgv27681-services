#!/bin/bash

if [[ -z ${EPICS_CA_ADDR_LIST} ]]; then
  echo "EPICS_CA_ADDR_LIST is not set, discovering IOCs DNS names in the namespace"
  export IPS="$(python3 /config/get_ioc_list.py --dns-names)"
else
if [[ -n ${EPICS_CA_ADDR_LIST} ]]; then
  cip="-cip"
fi

if [[ -z ${EPICS_PVA_ADDR_LIST} ]]; then
  echo "EPICS_PVA_ADDR_LIST is not set, discovering IOCs DNS names in the namespace"
  export IPS="$(python3 /config/get_ioc_list.py --dns-names)"
else
if [[ -n ${EPICS_PVA_ADDR_LIST} ]]; then
  cip="-cip"
fi
