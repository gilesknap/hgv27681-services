#!/bin/bash

# a bash script to source in order to set up your command line to in order
# to work with the hgv27681 IOCs and Services.

# check we are sourced
if [ "$0" = "$BASH_SOURCE" ]; then
    echo "ERROR: Please source this script"
    exit 1
fi

echo "Loading environment for hgv27681 deployment ..."

#### SECTION 1. Environment variables ##########################################

export EC_CLI_BACKEND="ARGOCD"
# the argocd project and root app
export EC_TARGET=hgv27681/hgv27681
# the git repo for this project
export EC_SERVICES_REPO=https://github.com/gilesknap/hgv27681-services
# declare your centralised log server Web UI
export EC_LOG_URL=''

#### SECTION 2. Install ec #####################################################

module load ec/p47
export EC_SERVICES_REPO=https://github.com/gilesknap/hgv27681-services
export EC_TARGET=hgv27681/hgv27681

#### SECTION 3. Configure Argocd Server ###################################

# enable shell completion for k8s tools
if [ -n "$ZSH_VERSION" ]; then SHELL=zsh; fi
source <(argocd completion $(basename ${SHELL}))

