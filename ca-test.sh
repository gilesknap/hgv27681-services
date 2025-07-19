#!/bin/bash

# set up the environment for caget for this shell
export EPICS_CA_NAME_SERVERS=localhost
export EPICS_CA_SERVER_PORT=9064

# demonstrate caget works
caget BL01T-DI-CAM-01:UPTIME
