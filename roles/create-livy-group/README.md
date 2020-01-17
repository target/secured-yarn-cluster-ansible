Create Livy Group
=================

Create Livy Group playbook for Ansible .
This playbook is for creating data group by looking for appropriate name in cloud. This group can be helpful in running roles against the existing created cluster

Requirements
------------

Ansible version at least v2.7.2


Example Playbook
----------------

```yaml
- os_server_facts:
    server: "server.example*"
  register: os_hosts

  add_host:
    name: "{{ item['name'] }}"
    groups: livynode_group
  with_items: "{{ os_hosts.ansible_facts.openstack_servers }}"
```
