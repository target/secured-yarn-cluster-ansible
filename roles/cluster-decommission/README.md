Cluster Decommission
=================

Cluster decommission playbook for Ansible .
This playbook is for decommissioning the cluster by removing the nodes. It deletes hadoop nodes both data and master nodes.
Also deletes zookeeper & livy.

Requirements
------------

Ansible version at least v2.7.2


Example Playbook
----------------

```yaml
- name: Delete instances for master
  os_server:
    name: "server.example"
    state: "absent"
```
