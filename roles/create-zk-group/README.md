Create Zookeeper Group
=================

Create Zookeeper Group playbook for Ansible .
This playbook is for creating data group by looking for appropriate name in cloud. This group can be helpful in running roles against the existing created cluster

Requirements
------------

Ansible version at least v2.7.2


Example Playbook
----------------

```yaml
- name: create zookeeper instances group
  os_server_facts:
    server: "{{ zookeeperNamePrefix }}*"
    cacert: "{{ cacert }}"

-  add_host:
    name: "{{ item['name'] }}"
    groups: zookeepersnode_group
    ansible_host: "{{ item.accessIPv4 }}"
    ansible_ssh_host: "{{ item.accessIPv4 }}"
```
