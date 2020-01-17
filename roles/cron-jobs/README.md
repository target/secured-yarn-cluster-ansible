Cron Jobs
=================

Cron Jobs playbook for Yarn Cluster.
This playbook will create cron entry on all the node(s) . These cron jobs can be configured as per the Requirements.
For Eg. This can remove audit logs every 2 hours if any


Requirements
------------

Ansible version at least v2.7.2

Role Variables
--------------

```yaml
hours: "*/2"
jobs:
  - "command or script to clean up logs"
```

Example Playbook
----------------

```yaml
- cron:
  name: Delete Old Audit Logs
  minute: 0
  hour: "{{ hours }}"
  job: "{{ item }}"
```
