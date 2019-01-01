# Design Goals

Create a JupyterHub teaching reference deployment that is simple yet
functional:

* [x] Use a single server.
* [x] use the default jupyterhub proxy
* [ ] Use Nginx as a frontend proxy, serving static assets, and a termination
  point for SSL/TLS.
* [x] Configure using Ansible scripts.
* [x] generate self signed SSL certificates for the hub
* [ ] Use (optionally) https://letsencrypt.org/ for generating SSL certificates.
* [x] Uses Docker to serve the hub and user servers

## Prerequisites

To *deploy* this JupyterHub reference deployment, you should have:

- An empty CentOS server running the latest stable release
- A valid DNS name

For *administration* of the server, you should also:

- Specify the admin users of JupyterHub.
- Allow SSH key based access to server and add the public SSH keys of GitHub
  users who need to be able to SSH to the server as `root` for administration.

For *managing users and services* on the server, you will:

- Create "Trusted" users on the system, meaning that you would give them a
  user-level shell account on the server
- Authenticate and manage users with either:
    - GitHub OAuth
    - Google OAuth
    - CAS
- Manage the running of jupyterhub and nbgrader using docker
