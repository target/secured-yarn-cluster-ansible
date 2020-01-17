Create OS Instance
=================

Create OS Instance playbook for Ansible
This playbook will create masternode , datanode & Livy node .


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
- name: launch instances for master
  os_server:
    name: "{{ masterNamePrefix }}{{ item.0 }}.{{ domain_name }}"
    state: "{{ state }}"
    key_name: "{{ sshKeyName }}"
    availability_zone: "{{ item.1 }}"
    nics:
      - net-id: "{{ network.id }}"
    image: "{{ image }}"
    cacert: "{{ cacert }}"
    security_groups: "{{ securityGroups }}"
    flavor: "{{ masterOsFlavor }}"
    wait: yes
    auto_ip: yes
    reuse_ips: no
    api_timeout: 60
```
