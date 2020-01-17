Create Volume
=================

Create Volume playbook for Ansible
This playbook creates cinder volume which can be attached to hdfs


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
- name: create cinder volumes data
  os_volume:
    state: "{{ state }}"
    display_name: "{{ item }}-vol"
    size: "{{ dataVolumeSize }}"
```
