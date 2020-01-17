JDK
=================

JDK playbook for Ansible

This playbook is for installing jdk and configuring JAVA_HOME

- Install jdk
- Set JAVA_HOME if configured.
- Install wget and krb5 libs util

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
  yum:
    name: "{{ item }}"
    state: present
  with_items:
     - wget
     - krb5-workstation
     - krb5-libs
     - nfs-utils
```
