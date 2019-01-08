# Overview [![Build Status](https://cloud.drone.io/api/badges/rice-comp543/jupyterhub-deploy-teaching-docker/status.svg)](https://cloud.drone.io/rice-comp543/jupyterhub-deploy-teaching-docker)

The goal of this repository is to produce a reference deployment of JupyterHub
for teaching with nbgrader leveraging Docker for serving the hub and user
containers.

---

The main use case targeted is **small to medium groups of trusted users
working on a single server** who want environments managed by Docker.

This repository was inspired by the following reference deployments from
Jupyter:  

* [JupyterHub Deploy Teaching](https://github.com/jupyterhub/jupyterhub-deploy-teaching)
* [JupyterHub Deploy Docker](https://github.com/jupyterhub/jupyterhub-deploy-docker)

## Quick Start

### install ansible galaxy requirements

```
ansible-galaxy install -r requirements.yml
```

### add an inventory for your CentOS machine

Currently only CentOS is supported.  Provide ansible a domain and IP of the
server you'd like to deploy to in `inventory/hosts`:

```ini
[jupyterhub_hosts]
www.example.com ansible_host=0.0.0.0
```

### add a host variable file

Configure your host in `host_vars/www.example.com`.  For more details see [Hub
Configuration](./hub-configuration).

### run and deploy to test machine

```bash
make deploy
```
