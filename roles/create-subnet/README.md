Create Subnet
=================

Create Subnet playbook for Ansible
This playbook creates subnet for openstack cloud provider.


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
- name: creating the test subnet
  os_subnet:
    state: "{{ state }}"
    network_name: "{{ network.id }}"
    name: "{{ subnetName }}"
```
