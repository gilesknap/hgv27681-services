# hgv27681 IOC Instances and Services

This repository holds the a definition of hgv27681 IOC Instances and services. Each sub folder of the `services` directory contains a helm chart for a specific service or IOC.

Here we have implemented INFN's fixed clusterIP helm function `allocateIpFromName`.

- IP addresses in argus allocated by allocateIpFromName
  - CIDR = baseIp: "10.96.0.0/12"
  - hgv27681.bl01t-di-cam-01 = 10.111.7.5
  - hgv27681.bl01t-mo-sim-01 = 10.103.7.44


How to set up a ssh tunnel to the cluster (from VPN or a DLS workstation):

```bash
ssh -f -L 9064:172.23.169.1:9064 -L 9075:172.23.169.1:9075 -L 10080:172.23.169.31:80 hgv27681@pc0116 -N
```

This is where:
- gateways loadbalancer IP is: 172.23.169.1
- epics-pvcs loadbalancer IP is: 172.23.169.31
- my home PC is pc0116 (but you could also pick a PC in science network to avoid firewall issues)
- 9064, 9075, and 10080 are the ports used by the gateways (ca, pva) and demo.bob OPI respectively.