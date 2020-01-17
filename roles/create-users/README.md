Create Users
=================

Create Users playbook for Ansible
This playbook creates users on the cluster created and also makes entry in /etc/hosts for ip resolution

This playbook executes the following tasks
- Add IP address of all hosts to all hosts
- Allow 'wheel' group to have passwordless sudo
- Create User Account for installing and configuring Yarn cluster
- Set Password never expires to users
- Distributes public key in all the nodes so that SSH can be allowed

Requirements
------------

Ansible version at least v2.7.2

Role Variables
--------------

```yaml
users:
   - hdfs
   - yarn
   - mapred
   - nfsserver
```

Example Playbook
----------------
Add IP address of all hosts to all hosts

```yaml
lineinfile:
  dest: /etc/hosts
  regexp: ".*{{ hostvars[item]['ansible_default_ipv4']['address'] }} {{ item }}$"
  line: "{{ hostvars[item]['ansible_default_ipv4']['address'] }} {{ item }}"
```

Allow 'wheel' group to have passwordless sudo

```yaml
lineinfile:
  dest: /etc/sudoers
  state: present
  regexp: '^%hadoop'
  line: '%hadoop ALL=(ALL) NOPASSWD: ALL'
```
