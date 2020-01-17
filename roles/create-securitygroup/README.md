Create Security Group
=================

Create Security Group playbook for Ansible
This playbook creates few security rules for ingress & esgress.

- Create a new security group allowing any ICMP
- Create a new security group allowing any SSH connection
- Create a new security group allowing any http connection
- Create a new security group allowing any tcp connection form port 1 to 65535


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

OS security group creation

```yaml
- name: create a new security group
  os_security_group:
    state: "{{ state }}"
    name: "{{ securityGroups }}"
```

OS security rule creation

```yaml
- os_security_group_rule:
  security_group: "{{ securityGroups }}"
  protocol: tcp
  cacert: "{{ cacert }}"
  port_range_min: 22
  port_range_max: 22
  remote_ip_prefix: 0.0.0.0/0
```
