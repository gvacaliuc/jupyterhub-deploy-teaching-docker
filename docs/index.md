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

### run and deploy to test machine

Sets up a test CentOS container to deploy:  

* [x] DummyAuthenticator
* [x] Docker Spawner w/ Form
* [x] SSL Termination

```bash
git clone https://github.com/rice-comp543/jupyterhub-deploy-teaching-docker.git
docker-compose up -d 
make deploy HOSTS=inventory/test-hosts.ini
```

then open https://localhost:8000 in your browser.  
