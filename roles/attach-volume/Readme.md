Attach Volumes
=================

Attach volume playbook for Ansible .
This playbook attaches cinder volume to openstack instances


Requirements
------------

Ansible version at least v2.7.2


Example Playbook
----------------

```yaml
  - name: Attach the data volume
    os_server_volume:
      state: "present"
      server: "example.server"
      volume: "example.server-vol"
```
