# Ansible role for FileBeat

[![Build Status](https://travis-ci.org/torian/ansible-role-filebeat.svg)](https://travis-ci.org/torian/ansible-role-filebeat)

An Ansible Role that installs FileBeat on Red Hat/CentOS or Debian/Ubuntu.

## Tested On

  * EL / Centos (6 / 7)
  * Debian (Wheezy / Jessie)
  * Ubuntu (Precise / Trusty)
  * Solaris

## Role Variables

Available variables are listed below, along with their default values as
definied in `defaults/main.yml`.

FileBeat user and group. If you run FileBeat with a user other than root make
sure your logs are readable by the FileBeat user. Add the FileBeat user to a
privileged group, with access to your logs.

On Ubuntu you would add the user to the `adm` group. On CentOS you can adjust
the permissions with the `setfacl` command, e.g. `sudo setfacl -m g:filebeat:r
<path>`.

    filebeat_user: root
    filebeat_group: root

Create the `filebeat` user and group.

    filebeat_create_user: true

FileBeat version to use.

    filebeat_version: 5.x

Make use of the FileBeat apt repo.

You may use a URL to install a specific version. To do so, change 
`filebeat_use_repo` value to `false`, then (optionally) adjust the 
value of `filebeat_package_baseurl` (which has a default value set for you).

    filebeat_use_repo: true

FileBeat base URL for package download if `filebeat_use_repo: false`

    filebeat_deb_baseurl: "https://artifacts.elastic.co/downloads/beats/filebeat"

Start FileBeat at boot time.

    filebeat_start_at_boot: true

FileBeat version upgrade. This option allows package upgrades.

    filebeat_upgrade: false

FileBeat configuration file.

    filebeat_config_file: /etc/filebeat/filebeat.yml

FileBeat registry file.

    filebeat_config_registry_file: /var/lib/filebeat/registry

The FileBeat configuration is built based on the variable `filebeat_config`.
For easier management of the contents, the `filebeat_config` variable is made
up of multiple other variables:

* `filebeat_config_prospectors`
* `filebeat_config_output`
* `filebeat_config_shipper`
* `filebeat_config_logging`

```yaml
filebeat_config_prospectors: |
  filebeat:
    prospectors:
      -
        input_type: log
        paths:
          - /var/log/*.log
        registry_file: "{{filebeat_config_registry_file}}"
filebeat_config_output: |
  output:
    elasticsearch:
      hosts: [ 'localhost:9200' ]
filebeat_config_shipper: |
  shipper:
filebeat_config_logging: |
  logging:
    files:
      rotateeverybytes: 10485760 # = 10MB
filebeat_config: |
  {{filebeat_config_prospectors}}
  {{filebeat_config_output}}
  {{filebeat_config_shipper}}
  {{filebeat_config_logging}}
```

FileBeat templates (a list of templates to install).
These templates will be copied to the /etc/filebeat directory
and can be used in the elasticsearch output for example.

https://www.elastic.co/guide/en/beats/filebeat/current/elasticsearch-output.html#_template

    filebeat_templates: []

## Usage
```yaml
    - hosts: logging
      roles:
        - { role: torian.filebeat }
```

## License

See [License](LICENSE)

## Author Information

This role was created in 2016 by Emiliano Castagnari.

