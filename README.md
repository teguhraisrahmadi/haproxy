# KubeEZ LoadBalancer
This repository contains the configuration and setup for **HAProxy** as a load balancer for a Kubernetes cluster. It is designed to distribute traffic across Kubernetes control plane (master) nodes and worker nodes, providing high availability, load distribution, and reliable access to the cluster.

# Key Features
- Load balancing for Kubernetes control plane nodes
- Traffic distribution across worker nodes
- High availability for Kubernetes services
- HAProxy configuration and deployment examples
- Suitable for on-premises and self-managed Kubernetes environments

## Getting Started
> Recommended directory: /opt
```
curl -L https://github.com/teguhraisrahmadi/haproxy/archive/refs/heads/main.tar.gz | tar -xz && mv haproxy-main haproxy
```

> ⚠️ Important: The provided configuration is an example and must be customized to match your Kubernetes cluster topology and network environment before deployment.

### Configuration
-  00-global.cfg
```
global
    # Enable log
    log stdout format raw local0

defaults
    # Enable log
    log     global
...
```
- 10-workers.cfg
```
...
backend be_http_workers
    balance roundrobin
    option tcp-check

    # Please adjust with worker ip and ingress or gateway api port
    server worker0 10.10.x.30:32xxx check
    server worker1 10.10.x.31:32xxx check

backend be_https_workers
    balance roundrobin
    option tcp-check

    # Please adjust with worker ip and ingress or gateway api port
    server worker0 10.10.x.30:33xxx check
    server worker1 10.10.x.31:33xxx check
```
- 20-masters.cfg
```
...
backend apiserver_masters

    # Please adjust with master ip and port
    server master0 10.10.x.20:6443 check
```

## Requirements
Before running, make sure you have:
- **Operating system:** Linux-Based
- **Privileges:** Root access or `sudo` privileges
- **Internet:** An active internet connection
- **Required tools:** `curl` must be installed and available in the system `PATH`
- **Environment:** A supported environment for running Docker & Docker Compose
- **System resources:** At least **2 CPU cores and 4 GB RAM**

## ⚠️ Disclaimer
This project is intended primarily for learning, development, testing, and lab environments.

Before using it in a production environment, review the docker compose carefully and make sure the configuration matches your infrastructure requirements.

Always understand what a docker compose does before running it with sudo or root privileges.