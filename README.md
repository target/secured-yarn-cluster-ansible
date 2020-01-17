Project Description:
===========

   <p>Ansible playbook has two separate flows, one for setting up kerberos and another for provisoning and configuring secure yarn cluster setup using kerberos.</p>

<p>Ansible playbook will execute the below roles:</p>
<ul>
<li>Creating Openstack network , subnet ,router and security groups</li>
<li>Creating Openstack instances</li>
<li>Creating and attaching Cinder volumes for data/slave nodes.</li>
<li>Installing OpenJDK on all the created instances.</li>
<li>Kerberos setup for security.</li>
<li>Secured Yarn and HDFS.</li>
<li>Installing Livy for exposing REST endpoints for spark job executions.</li>
<li>Zookeeper is used for high availablity for yarn and livy.</li>
<li>Filebeat and telegraf</li>
</ul>

Requirements
------------

python >= 2.7

Ansible version at least v2.7.2

[Ansible Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

Install Python Modules Required for Ansible Openstack Module
```yaml
  shade
  openssl
  openstacksdk
```

Minimum requirements for multi node secure yarn cluster setup:


  <ul>
  <li>  1 node for kerberos server with minimum 2 vCPU's and 4GB RAM.</li>
  <li>  3 nodes for zookeeper with minimum 2 vCPU's and 4GB RAM.</li>
  <li>  1 node for livy with minimum 2 vCPU's and 4GB RAM.</li>
  <li>  2 master nodes with minimum 2 vCPU's and 4GB RAM.</li>
  <li>  2 data/slave nodes with minimum 4 vCPU's and 8GB RAM. </li>
  </ul>

Yarn Cluster Provisioning With Kerberos Enabled
=================

Before Running the Ansible Playbook for provisoning the Yarn cluster (E2E) we need to set up Kerberos server.

Config files for Kerberos and Secure Yarn cluster Set Up
---------------- 

All the config parmeters should be added in a input files.For details [Click here](#Add-Or-Update-Input-Paramter-JSON-file-As-Per-Project-Requirement)
There are two different input files, one for setting up kerberos and another for secure yarn cluster.
Below are the sample input files location:

<b>Sample Kerberos Input file</b>

```yaml

input_files/test/input-kerberos-template.json

```

<b>Sample Secure Yarn Input file</b>

```yaml

input_files/test/input-template.json

```

Password Vault
---------

We are using ansible vault for storing secrets like keystore,truststore and kerberos admin password. 

<b>Sample Vault File</b>
```yaml

 group_vars/all/vault.yml

```

Sample Vault File Password ( change using ansible-vault rekey ): <b>admin</b>


Kerberos Server SetUp Command ( Skip this step if you already SetUp Kerberos )
----------------

   If you dont have kerberos server for enabling security on yarn and livy then you need to create one by updating the kerberos template file and executing the below command.
   Source the Openstack project/tenant RC file or export all openstack OS_* variables for creating instances on the particular openstack project/tenant.

```yaml

source OS_PROJECT_NAME-openrc.sh
ansible-playbook kerberos_setup.yml -e "@input_files/test/input-kerberos-template.json" --ask-vault-pass

```

Secure Yarn Cluster Provisoning Command
----------------

```yaml

source OS_PROJECT_NAME-openrc.sh
ansible-playbook yarn_cluster_setup.yml -e "@input_files/test/input-template.json" --ask-vault-pass

```

### Add Or Update Input Paramter JSON file As Per Project Requirement
----------------

```yaml
{
"state":"present",
"noOfData":[ 1,2 ],                             --> Number of data instance required for the Yarn cluster
"noOfMaster":[ 1,2 ],                           --> Number of Master instance required for the yarn cluster
"noOfLivy":[ 1 ],                               --> Number of Livy instance required for the yarn cluster
"noOfZookeeper":[ 1,2 ],                        --> Number of Zookeeper instance required for the yarn cluster
"masterOsFlavor":"gp-4cpu-8GB",                 --> Openstack Flavor for Master instance(s)
"dataOsFlavor":"gp-4cpu-8GB",                   --> Openstack Flavor for Data instance(s)
"livyOsFlavor":"gp-4cpu-8GB",                   --> Openstack Flavor for Livy instance(s)
"zookeeperOsFlavor":"gp-4cpu-8GB",              --> Openstack Flavor for Zookeeper instance(s)
"masterNamePrefix":"test-master-node",          --> Hostname prefix for Master instance(s)
"dataNamePrefix":"test-data-node",              --> Hostname prefix for Data instance(s)
"livyNamePrefix":"test-livy-node",              --> Hostname prefix for Livy instance(s)
"zookeeperNamePrefix":"test-zk-node",           --> Hostname prefix for Zookeeper instance(s)
"av_z_master":[ "az1", "az2"],                  --> Availability zones where master instance(s) are created
"av_z_data":[ "az1", "az2" ],                   --> Availability zones where data instance(s) are created
"av_z_livy":[ "az1" ],                          --> Availability zones where livy instance(s) are created
"av_z_zookeeper":[ "az1","az2"],                --> Availability zones where zookeeper instance(s) are created
"volume_az":"az1v",                             --> Availability zones where volume(s) are created
"dataVolumeSize":"40",                          --> size of the volume(s) in GB
"sshKeyName":"<SSH_KEY_NAME>",                  --> SSH Key Name 
"publicKeyFile":"./keys/public_keys",           --> add public keys who needs access for the instance(s).
"securityGroups":"<SECURITYGROUP_NAME>",        --> Security Group Name
"image":"<OS_IMAGE_NAME>",                      --> OS Image Name
"cacert":"<CA_CERT_PATH>",                      --> CA Cert Path If any
"networkName":"<OS_NETWORK_NAME>",              --> Network to be created if network doesn't exist.
"subnetName":"<OS_SUBNET_NAME>",                --> Subnet to be created if subnet doesn't exist. 
"cidr":"<CIDR_IP_RANGE>",                       --> Define Classless Inter-Domain Routing range
"gatewayIp":"<INTERNET_GATEWAY_IP>",            --> Gateway IP address
"router":"<OS_ROUTER_NAME>",                    --> Router Name required for creating router
"KDC_HOSTNAME":"<KERBEROS_HOSTNAME>",           --> Kerberos Hostname/IP Address 
"KDC_REALM":"<KERBEROS_REALM>",                 --> Kerberos Realm Name
"KDC_ADMIN_USER": "<KERBEROS_ADMIN_USER>",      --> Kerberos admin user for creating principals and keytab file(s)
"hdversion":"<HADOOP_VERSION>",                 --> Hadoop Version to be installed
"spark_version":"<SPARK_VERSION>",              --> Spark Version to be installed ( default one )
"list_of_spark_version": "<LIST_OF_SPARK_VER>", --> List of Spark versions to be installed
"livy_version":"<LIVY_VERSION>",                --> Livy Version to be installed
"cluster_name":"<CLUSTER_NAME_ZP>",             --> Cluster name which is required for zookeeper
"logstopic" : "<LOGS_TOPIC_NAME>",              --> Kafka topic where logs need to be sent
"logsbroker" : "<LOGS_BROKER_SERVER_NAME>",     --> kafka broker name where logs need to be sent
"kdcKeytabPath" : "<KERBEROS_KEYTAB_TMP_PATH>",  --> Temp Path for creating the keytab file to copy on the respective node(s).
"userName" : "<USERNAME_WITH_SUDO>",             --> User which has sudo access for all the server(s)
"domain_name": "<COMPANY_DOMAIN_NAME>",          --> Company Domain Name ( e.x abc.com ) which will append with all prefix names for the instance(s)
"certs_browseconfig": "<CA_CERTIFICATE_PATH>",   --> CA certificates if any required for provisioning node(s) from Openstack
"dnsnameservers": ["<LIST_OF_DNS_SERVERS>"],     -->  List of DNS nameservers required for the subnet. 
"volumePath": "<SOURCE_VOLUME_PATH>"             --> Source Volume Device ( e.x /dev/vdb ).
}
```

Cluster URL's
----------

Once the cluster is provisoned , below are the default URL's

  - Yarn URL : http://<MASTER_HOSTNAME_OR_IP>:8088/cluster
   
  - HDFS URL : https://<MASTER_HOSTNAME_OR_IP>:9871
   
  - Livy URL : http://<LIVY_HOSTNAME_OR_IP>:8998 

# Future Scope
  
  <p>Support:</p>
  <ul>
   <li>AWS, GCP and AZURE Cloud Providers </li>
   <li>Bare Metal </li>
   <li>Non Secure Yarn Cluster Set Up</li>
  </ul>

# Bugs and Feature Requests

Found something that doesn't seem right or have a feature request? First, checkout our [contribution guidelines](CONTRIBUTING.md), then [open a new issue](https://git.target.com/DataProcessing/yarn_cluster_e2e_os/issues/new/).

# Contributors

A huge shoutout to all the contributors and supporters of this project. THANK YOU!!!

<a href="https://github.com/reddymh/" target="_blank">
  <img src="https://github.com/reddymh.png?size=64" width="64" height="64" alt="Rajshekar Reddy">
</a>
<a href="https://github.com/chandrakumar1985" target="_blank">
  <img src="https://github.com/chandrakumar1985.png?size=64" width="64" height="64" alt="ChandraBhanu Kumar">
</a>
<a href="https://github.com/riteshsolankee/" target="_blank">
  <img src="https://github.com/riteshsolankee.png?size=64" width="64" height="64" alt="Ritesh Kumar">
</a>
<a href="https://github.com/mayurvaid/" target="_blank">
  <img src="https://github.com/mayurvaid.png?size=64" width="64" height="64" alt="Mayur Vaid">
</a>
<a href="https://github.com/SriniRasi/" target="_blank">
  <img src="https://github.com/SriniRasi.png?size=64" width="64" height="64" alt="Srinivasan Rasiappan">
</a>

# Libraries

Target's Secured Yarn Cluster depends from several ansible roles. Target would like to thank and acknowledge the developers of the following dependencies:
<ul>
   <li>Ansible Zookeeper: https://galaxy.ansible.com/ansibleshipyard/ansible-zookeeper </li>
   <li>Telegraf: https://galaxy.ansible.com/dj-wasabi/telegraf </li>
   <li>Filebeat: https://galaxy.ansible.com/torian/filebeat </li>
</ul>

# Copyright and License
[LICENSE](LICENSE.md)

Copyright (c) 2019 Target Brands, Inc.

# Notice
Ansible is a registered trademark of Red Hat,Inc. in the United States and other countries.
