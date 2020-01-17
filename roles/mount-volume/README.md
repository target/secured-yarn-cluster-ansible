Mount Volume
=================

Mount Volume playbook for Ansible
This playbook performs following action
- Unmount Volume
- Create directory
- Mount Volume


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
  state: mounted
  opts: nofail
```
