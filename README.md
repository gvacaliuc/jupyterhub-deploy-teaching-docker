# Jupyterhub Deploy Teaching Docker

The goal of this repository is to produce a reference deployment of JupyterHub
for teaching with nbgrader leveraging Docker for serving the hub and user
containers.

The main use case targeted is **small to medium groups of trusted users
working on a single server** who need .

## Design goal of this reference deployment

Create a JupyterHub teaching reference deployment that is simple yet
functional:

* [x] Use a single server.
* [x] Use the default jupyterhub proxy
* [ ] Use Nginx as a frontend proxy, serving static assets, and a termination point for SSL/TLS.
* [x] Configure using Ansible scripts.
* [x] generate self signed SSL certificates for the hub
* [ ] Use (optionally) https://letsencrypt.org/ for generating SSL certificates.
* [x] Uses Docker to serve the hub and user servers
* [ ] Authentication
    * [x] CAS Authentication
    * [x] Most OAuth implementations
    * [ ] LDAP Authentication

## Prerequisites

To *deploy* this JupyterHub reference deployment, you should have:

- An empty CentOS server running the latest stable release
- A valid DNS name

For *administration* of the server, you should also:

- Specify the admin users of JupyterHub.
- Allow SSH key based access to server and add the public SSH keys of GitHub
  users who need to be able to SSH to the server as `root` for administration.

For *managing users and services* on the server, you will:

- Authenticate and manage users with either:
  * GitHub OAuth
  * Google OAuth
  * CAS
- Manage the running of jupyterhub and nbgrader using docker.

## Installation and Usage

You'll need to create two files: an ansible inventory file that indicates what
hosts you'd like to deploy to and a host variables file that controls the 

The inventory file should look something like this:

```ini
[jupyterhub_hosts]
hostname.example
```

The host_vars file should be named `host_vars/hostname.example` and look
something like this (if using CAS Authentication):

```yaml
---

# ---------------------------------------------------
# JupyterHub Authentication
# ---------------------------------------------------

jh_authenticator:
  cas:
    login_url: "https://idp.example.com/idp/profile/cas/login"
    service_url: "https://{{ inventory_hostname }}/hub/login"
    validate_url: "https://idp.example.com/idp/profile/cas/serviceValidate"

jh_singleuser_images:
  - jupyter/scipy-notebook
  - jupyter/pyspark-notebook

jupyterhub_admin_users: [user1, user2]
jupyterhub_users: [user1, user2, user3, user4]


# ---------------------------------------------------
# Domain / SSL Details
# ---------------------------------------------------

# FQDN for JupyterHub
jh_public_domain: "{{ inventory_hostname }}"
jh_country_code: US

# Organization Name for the self-signed SSL Certificate
jh_csr_org_name: Foo University

# Email for the self-signed SSL Certificate
jh_csr_email: email@example.com
```

### Deploy

Then, all you should need to do to deploy is run:

```
make deploy HOSTS=inventory/hostfile
```
