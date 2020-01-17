Download Certs
=================

Download Certs playbook for Ansible

This playbook is for downloading certificate which is based on user specified requirement.

Requirements
------------

Ansible version at least v2.7.2

Role Variables
--------------

```yaml
 None
```

Example Playbook
----------------

```yaml
get_url:
  url: "{{certs_browseconfig}}"
  dest: ./certs/ca-bundle.crt
```
