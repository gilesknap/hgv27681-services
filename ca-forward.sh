#!/bin/bash
set -e

# restart the gateways service to pick up any new/restarted IOCs
# Note: ArgoCD will automatically start a new pod and deletion will complete
# when the new pod is ready.

if [[ -n $RESTART ]]; then
    echo "Restarting gateways service ..."
    podname=$(kubectl get pods -l app=bl01t-gateways -o name)
    kubectl delete $podname --wait=true

    # make sure the new pod is ready
    kubectl wait deploy/bl01t-gateways --for=jsonpath='{.status.readyReplicas}=1'
    sleep 2
fi

# forward ports for CA and PVA to the gateways service
# kubectl port-forward service/bl01t-gateways 9064 9065

# UPDATE - just forward direct to the gateways service
# this works over VPN and when the science/corp firewall is blocking the ports
ssh -f -L 9064:172.23.169.1:9064 -L 9065:172.23.169.1:9065 hgv27681@pc0116 -N

