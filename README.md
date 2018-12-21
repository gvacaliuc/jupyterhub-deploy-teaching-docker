# ORION Docker Deployment

Ansible scripts to deploy our jupyterhub installation to ORION, Rice's
OpenNebula installation.  

Sets up:  
[] Postgres Database for each whitelisted user
    [] copies contents of a template database
    [] initial plaintext password / user file
[x] JupyterHub running in a container
[] User Data persisted in Docker Volume
    [] volume backups to cloud storage
[] Authenticator
    [x] GitHub OAuth
    [] [CAS Authenticator](https://github.com/cwaldbieser/jhub_cas_authenticator) to plug in to Rice's CAS
[] Spawner
    [x] [DockerSpawner](https://github.com/jupyterhub/dockerspawner) to spawn new user containers
    [] [Docker Form Spawner]() to select which docker image to launch for the user
