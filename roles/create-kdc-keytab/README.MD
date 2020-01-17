KDC Keytab
=================

KDC Keytab for Ansible

This playbook creates keytabs for all the users which is then distributed across all the clusters.

Follwing tasks are executed by this playbook
- Deletes any existing keytab files
- Creates directory if it does not exists
- Creates KRB prinicpal for the all the users
- Generates keytab for all the users

Requirements
------------

Ansible version at least v2.7.2

Role Variables
--------------

```yaml
 KDC_KEYTAB_PATH: "{{ kdcKeytabPath }}"

```

Example Playbook
----------------

Creating KRB Prinical


```yaml
- name: Create Krb principals
  shell: |
         echo "{{ item.0 }} {{ item.1 }}"
         kadmin.local -w "{{ KDC_PASSWORD }}" -q "addprinc -randkey {{ item.1 }}/{{ item.0 }}@{{ KDC_REALM }}"
```

Creating keytab

```yaml
- name: Create Krb principals
  shell: |
         echo "{{ item.0 }} {{ item.1 }}"
         kadmin.local -w "{{ KDC_PASSWORD }}" -q "ktadd -norandkey -k {{ KDC_KEYTAB_PATH }}/{{ item.1 }}-{{ hostvars[item.0].inventory_hostname_short }}.service.keytab {{ item.1 }}/{{ item.0 }}@{{ KDC_REALM }} HTTP/{{ item.0 }}@{{ KDC_REALM }}"
```
