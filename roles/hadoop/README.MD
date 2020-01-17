Hadoop
=================

Hadoop playbook for Ansible


Requirements
------------

Ansible version at least v2.7.2

Role Variables
--------------

```yaml
 hd_version: 3.1.2

 hadoop_version: "{{ hd_version | replace('.','_')}}"

 name: hadoop

 hadoop_root_dir: /opt/hadoop

 groupname: hadoop

 hadoop_url: http://mirrors.estointernet.in/apache/hadoop/common/{{ name }}-{{ hd_version  }}/{{ name }}-{{ hd_version  }}.tar.gz

 dirs:
   - /opt/hadoop
   - /opt/hdfs

 JAVA_HOME: $(readlink -f /usr/bin/java | sed "s:/jre/bin/java::")

 HADOOP_HOME: "{{hadoop_root_dir}}/{{ name }}-{{ hadoop_version }}"

 PATH: "$PATH:{{ HADOOP_HOME }}/bin:{{ HADOOP_HOME }}/sbin"

 HADOOP_CONF_DIR: "{{ HADOOP_HOME }}/etc/hadoop"

 HDFS_HOME: "{{ hadoop_root_dir }}/hdfs"

 KDC_REALM: dpp

 KDC_KEYTAB: /etc/security/dpp/keytab

 HDFS_NAME_DIR: "{{ HDFS_HOME }}/name"

 HDFS_DATA_DIR: "/mnt/data"

 TRUSTSTORE_DIR: /etc/security/serverKeys

 TRUSTSTORE_FILE_LOCATION: "{{ TRUSTSTORE_DIR }}/hadoop.truststore"

 TRUSTSTORE_PASSWORD:

 KEYSTORE_FILE_LOCATION: "{{ TRUSTSTORE_DIR }}/{{ ansible_hostname }}.keystore"

 KEYSTORE_PASSWORD:

 APP_LOGS_DIR: "/opt/applogs"

 APP_CONF_DIR: "/opt/appconf"

 APP_LIB_DIR: "/opt/applib"

 TEMPLATE_FILENAMES:
    - core-site.xml
    - hdfs-site.xml
    - mapred-site.xml
    - ssl-client.xml
    - ssl-server.xml
    - yarn-site.xml

 users:
    - hdfs
    - yarn
    - mapred
    - nfsserver

 TMP_DIRS:
    - /tmp/hadoop-yarn/nm-local-dir/filecache
    - /tmp/hadoop-yarn/nm-local-dir/usercache

```

Example Playbook
----------------

```yaml
- name: Installing Hadoop
  hosts: all
  sudo: yes
  roles:
    - role: hadoop
```

Custom IP per host group

```
zookeeper_ips: "
    {%- set ips = [] %}
    {%- for host in groups['zookeepers'] %}
    {{- ips.append(dict(id=loop.index, host=host, ip=hostvars[host]['ansible_default_ipv4'].address)) }}
    {%- endfor %}
    {{- ips -}}"
```
