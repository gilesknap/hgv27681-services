#!/bin/bash
set -e

# restart the gateways service to pick up any new/restarted IOCs
# Note: ArgoCD will automatically start a new pod and deletion will complete
# when the new pod is ready.
podname=$(kubectl get pods -l app=bl01t-gateways -o name)
kubectl delete $podname --wait=true

# make sure the new pod is ready
kubectl wait deploy/bl01t-gateways --for=jsonpath='{.status.readyReplicas}=1'
sleep 2

# forward ports for CA and PVA to the gateways service
kubectl port-forward service/bl01t-gateways 9064 9065


