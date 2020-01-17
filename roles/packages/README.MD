Packages
=================

Packages playbook for Ansible

This playbook is for installing custom packages on cluster


Requirements
------------

Ansible version at least v2.7.2

Role Variables
--------------

```yaml
yum_packages:
  - python-devel
  - gcc
  - gcc-c++
  - python-pip

python_packages:
  - pandas==0.19.2
  - mock==2.0.0
  - pyspark==2.4.0
```

Example Playbook
----------------

```yaml
- name: Install dependencies utilities
  pip:
   name: "{{ item }}"
   state: present
  become: yes
  with_items:
   - "{{ python_packages  }}"
```
