Delete Volume
=================

Delete Volume playbook for Ansible
This playbook performs following action
- Stops DFS service
- Stop Yarn service
- Unmount volume
- Detach volume
- Delete volume

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

Unmount Volume

```yaml
mount:
  path: /mnt/data
  src: /dev/vdb
  fstype: ext4
  state: unmounted
```

Detach Volume

```yaml
- name: Detach the data volume
  os_server_volume:
    state: "{{ state }}"
    server: "{{ item.0 }}"
    volume: "{{ item.0 }}-vol"
```
