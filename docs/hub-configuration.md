# Configuring JupyterHub

## Inventory

First, set up your inventory file to reflect the hosts you'd like to deploy
JupyterHub to.  

!!! tip "The `hosts` inventory file lists the servers managed by Ansible"

    This provides an inventory of host servers used for JupyterHub
    Edit the fqdn (fully qualified domain name) for your hub server
    For example:

        [jupyterhub_hosts]
        www.example.com

    Save file as `hosts` (without the file type suffix) when done editing.
    Saving the file as `hosts` after editing is important.  If you don't have
    a domain to your server yet, but know what it will be, you can tell 
    ansible to SSH using the server's IP address:

        [jupyterhub_hosts]
        www.example.com ansible_host=10.0.0.1

## Variables

Configure your host in `host_vars/www.example.com`.  Group configuration can be
found in `group_vars/jupyterhub_hosts`.  You shouldn't need to modify the group
variables!  You should be able to simply modify the variables below:

```yaml
---

# ---------------------------------------------------
# JupyterHub Authentication
# ---------------------------------------------------

# Uses the Generic OAuthenticator
jh_authenticator:
  oauth:
    callback_url: "https://{{ inventory_hostname }}:{{ jh_port_host }}/hub/oauth_callback"
    client_id: dd264e4e76a7cfe4fc65
    client_secret: 6bb33c59397f1c69b6165261d5a9816a0f5c357d

# Specifies which singleuser images we should pull and allow on the hub
jh_singleuser_images:
  - jupyter/scipy-notebook

# A list of users who should be made admin
jupyterhub_admin_users:
  - bob
  - sue

# A list of users who should be allowed to use the hub
jupyterhub_users:
  - bob
  - sue

# ---------------------------------------------------
# Domain / SSL Details
# ---------------------------------------------------

# FQDN for JupyterHub
jh_public_domain: "{{ inventory_hostname }}"
jh_country_code: US

# Organization Name for the self-signed SSL Certificate
jh_csr_org_name: Example Organization

# Email for the self-signed SSL Certificate
jh_csr_email: jane.doe@example.com
```
