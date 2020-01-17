Create Key Pair
=================

KDC Open stack instance creation playbook for Ansible


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
os_keypair:
  name: "{{ sshKeyName }}"
  state: "{{ state }}"
  cacert: "{{ cacert }}"
```
