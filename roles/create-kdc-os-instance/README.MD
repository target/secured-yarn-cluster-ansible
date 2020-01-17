KDC OS Instance
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
- name: launch instances for master
  os_server:
    name: "{{ kerberosNamePrefix }}.{{ domain_name }}"
    state: "{{ state }}"
    key_name: "{{ sshKeyName }}"
    availability_zone: "{{ item.1 }}"
    nics:
      - net-id: "{{ network.id }}"
    image: "{{ image }}"
    cacert: "{{ cacert }}"
    security_groups: "{{ securityGroups }}"
    flavor: "{{ kerberosOsFlavor }}"
    wait: yes
    auto_ip: yes
    reuse_ips: no
    api_timeout: 60
```
