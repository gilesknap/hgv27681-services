#!/bin/bash

# set up the environment for caget for this shell
export EPICS_CA_NAME_SERVERS=localhost:9064
export EPICS_PVA_NAME_SERVERS=localhost:9075
export EPICS_CA_MAX_ARRAY_BYTES=6000000
export EPICS_PVA_MAX_ARRAY_BYTES=6000000
export EPICS_CA_AUTO_ADDR_LIST=NO
export EPICS_PVA_AUTO_ADDR_LIST=NO

# demonstrate caget works
caget BL01T-DI-CAM-01:UPTIME
# demonstrate pvxget works
pvxget BL01T-DI-CAM-01:PVA:OUTPUT | grep uncompressedSize
