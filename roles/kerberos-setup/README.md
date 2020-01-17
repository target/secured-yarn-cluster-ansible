Kerberos Setup
=================

Kerberos Setup playbook for Ansible

This playbook is for setting up kerberos using krb5.conf.j2 template

- Create The Initial kerberos db
- Create an admin for the administering the kerberos database
- Start The krb5kdc service
- Start The kadmin service

Template
------------
krb5.conf.j2 - Krb5 configuration for kerberos setup

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
- name: Create The Initial kerberos db
  shell: kdb5_util -P {{ KDC_PASSWORD }} create -s; touch /var/kerberos/master_db_created creates=/var/kerberos/master_db_created

- name: Create an admin for the administering the kerberos database
  shell: kadmin.local -q "addprinc -pw {{ KDC_PASSWORD }} {{ KDC_ADMIN_USER }}/admin"; touch /var/kerberos/admin_created creates=/var/kerberos/admin_created
```
