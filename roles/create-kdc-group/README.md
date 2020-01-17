Create KDC Group
=================

Create KDC Group playbook for Ansible .
This playbook is for creating data group by looking for appropriate name in cloud. This group can be helpful in running roles against the existing created cluster

Requirements
------------

Ansible version at least v2.7.2


Example Playbook
----------------

```yaml
- name: create kerberos inventory group
  add_host:
    hostname: "kdc.server.example"
    groups: kdc_group
```
