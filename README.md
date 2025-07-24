# hgv27681 IOC Instances and Services

This repository holds the a definition of hgv27681 IOC Instances and services. Each sub folder of the `services` directory contains a helm chart for a specific service or IOC.

Here we have implemented INFN's fixed clusterIP helm function `allocateIpFromName`.

- IP addresses in argus allocated by allocateIpFromName
  - CIDR = baseIp: "10.96.0.0/12"
  - hgv27681.bl01t-di-cam-01 = 10.111.7.5
  - hgv27681.bl01t-mo-sim-01 = 10.103.7.44
