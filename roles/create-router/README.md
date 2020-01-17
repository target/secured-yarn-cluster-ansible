Create Router
=================

Create Router playbook for Ansible
This playbook creates router for openstack cloud provider.


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
- name: creating the router
  os_router:
    state: "{{ state }}"
    name: "{{ router }}"
    cacert: "{{ cacert }}"
```
