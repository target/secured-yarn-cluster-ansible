Livy
=================

Livy playbook for Yarn Cluster

Following are the  tasks that are executed
- Copy Keytab files to respective yarn nodes(master)
- Rename/Copy the livy conf template file
- Copy Hadoop Config files
- Download , Install and Configure Livy
- Download , Install and Configure Spark


Requirements
------------

Ansible version at least v2.7.2

Role Variables
--------------

```yaml
root_dir: /opt

livy_file_local_dir: /opt/clientcert/

livy_recovery_state: zookeeper

livy_artifact_name: livy

livy_version: 0.6.0-incubating

livy_default_name: apache-livy-{{ livy_version }}-bin

livy_artifact_repo_url: http://archive.apache.org/dist/incubator/livy/{{ livy_version }}/apache-livy-{{ livy_version }}-bin.zip

spark_artifact_name: spark

spark_version: 2.4.0

list_of_spark_version:
   - 2.1.1
   - 2.2.2
   - 2.3.0
   - 2.3.2
   - 2.4.0

export_variables:
   - JAVA_HOME
   - HADOOP_CONF_DIR
   - SPARK_HOME
   - LIVY_HOME
   - FLINK_HOME

spark_artifact_repo_url: https://archive.apache.org/dist/{{ spark_artifact_name }}

flink_artifact_name: flink

flink_version: 1.7.1

flink_artifact_repo_url: https://archive.apache.org/dist/flink/flink-{{ flink_version }}/flink-{{ flink_version }}-bin-hadoop28-scala_2.12.tgz

livy_root_dir: /opt/livy

spark_root_dir: /opt/spark

flink_root_dir: /opt/flink

livy_home_dir: "{{ livy_root_dir }}/{{ livy_artifact_name }}-{{ livy_version }}"

flink_home_dir: "{{ flink_root_dir }}/{{ flink_artifact_name }}-{{ flink_version }}"

spark_home_dir: /opt/spark/{{ spark_artifact_name }}-{{ list_of_spark_version[-1] }}

HADOOP_CONF_DIR: /opt/hadoop/conf

keytab_dir: /opt/keytab_files
```

Example Playbook
----------------

```yaml
- name: "Download livy-{{ livy_version }}"
  get_url: url={{ livy_artifact_repo_url }} dest={{ root_dir }}/{{ livy_artifact_name}}-{{ livy_version }}-incubating-SNAPSHOT-bin.zip  force=no owner={{ userName }} group={{ userName }}
  register: result
  until: result is success
  retries: 5
  delay: 5

- name: Unarchive livy tgz
  unarchive: src={{ root_dir }}/{{ livy_artifact_name}}-{{ livy_version }}-incubating-SNAPSHOT-bin.zip dest={{ livy_root_dir }} creates={{ livy_root_dir }}/{{ livy_artifact_name}}-{{ livy_version }} owner={{ userName }} group={{ userName }} mode=750 remote_src=yes

- name: Rename the livy folder name
  command: mv -f {{ livy_root_dir }}/{{  livy_default_name }} {{ livy_root_dir }}/{{ livy_artifact_name}}-{{ livy_version }}
  args:
    creates: "{{ livy_root_dir }}/{{ livy_artifact_name}}-{{ livy_version }}"
```
