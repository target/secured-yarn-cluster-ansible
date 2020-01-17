## Role: [create-users](create-users)
> **Task:** update the hostname ( remove novalocal )

> **Task:** set managed host flag to false ( not to update /etc/hosts at system boot )

> **Task:** Commenting a line in /etc/hosts containing IPv6

> **Task:** update the all node host entry in hosts file

> **Task:** Add IP address of all hosts to all hosts

> **Task:** Add IP address of all hosts to all hosts

> **Task:** make sure group hadoop exist on all the nodes

> **Task:** Allow 'wheel' group to have passwordless sudo

> **Task:** Create User Account for installing and configuring Yarn cluster

> **Task:** Set Password never expires to users

> **Task:** Add {{ userName }} user to hadoop group

> **Task:** Fetch public key from master

> **Task:** Copy The Public Key on all the nodes

> **Task:** Add The Key to authorized key file

> **Task:** Check SSH conection for all the created users from master node to all slave nodes

> **Task:** Disable IPv6 ALL

> **Task:** Check Whether IPv6 is disabled or not


## Role: [create-os-instance](create-os-instance)
> **Task:** launch instances for master

> **Task:** launch instances for data

> **Task:** launch instances for livy

> **Task:** Wait for Master instance creation to complete

> **Task:** Wait for Data instance creation to complete

> **Task:** Wait for Livy instance creation to complete

> **Task:** add hosts to inventory

> **Task:** add hosts to inventory

> **Task:** add hosts to inventory

> **Task:** Wait 30 Seconds to Spin Up All OST Instance (SSH)

> **Task:** Wait for SSH port to come up On newly created master clinet data and ingest OST instance

> **Task:** Wait for SSH to complete for all master client data and ingest nodes


## Role: [create-network](create-network)
> **Task:** creating network


## Role: [telegraf](telegraf)
> **Task:** Install the correct repository

> **Task:** Install the correct repository

> **Task:** Retrieve ec2 facts

> **Task:** Retrieve all ec2 tags on the instance

> **Task:** Copy the template for versions < 0.10.0

> **Task:** Copy the template for versions >= 0.10.0

> **Task:** Copy telegraf extra plugins


## Role: [create-dns](create-dns)
> **Author:** Mayur Vaid

> **Description:** Create DNS  role

> **Task:** fetch token for firing dns api

> **Task:** create dns


## Role: [create-data-group](create-data-group)
> **Task:** create master instances group

> **Task:** add hosts to inventory


## Role: [create-zookeeper-os-instance](create-zookeeper-os-instance)
> **Task:** launch instances for zookeeper

> **Task:** Wait for zookeeper instance creation to complete

> **Task:** add hosts to inventory

> **Task:** Wait 30 Seconds to Spin Up All OST Instance (SSH)

> **Task:** Wait for SSH port to come up On newly created zookeeper OST instance

> **Task:** Wait for SSH to complete for all zookeeper nodes


## Role: [filebeat](filebeat)
> **Task:** Include OS Family vars

> **Task:** Ensure Filebeat is enabled and started at boot


## Role: [jdk](jdk)
> **Task:** Copy and add user key to authorized keys

> **Task:** Include version-specific variables for CentOS/RHEL.

> **Task:** Include version-specific variables for Debian.

> **Task:** Define java_packages.

> **Task:** Set JAVA_HOME if configured.

> **Task:** Install wget and krb5 libs util

> **Task:** Extract And Copy Unlimited JCE Policy Jar's On all the nodes


## Role: [create-securitygroup](create-securitygroup)
> **Task:** create a new security group

> **Task:** Create a new security group allowing any ICMP

> **Task:** Create a new security group allowing any SSH connection

> **Task:** Create a new security group allowing any http connection

> **Task:** Create a new security group allowing any tcp connection form port 1 to 65535


## Role: [create-kdc-keytab](create-kdc-keytab)
> **Task:** Delete keytab file(s) if exist(s)

> **Task:** Create directory for storing keytab if not exist

> **Task:** Create Krb principals

> **Task:** Create Krb principals

> **Task:** Create Krb principals

> **Task:** Create KDC keytab file(s)

> **Task:** Create KDC keytab file(s) for Hadoop Master node(s)

> **Task:** Create KDC keytab file(s) for Livy node(s)

> **Task:** Create Krb principals for {{ userName }}

> **Task:** Fetch the generated keytab files


## Role: [cron-jobs](cron-jobs)
> **Task:** Configure Crontab File And Schedule For Every 2 Hours To Run


## Role: [create-master-group](create-master-group)
> **Task:** create master instances group

> **Task:** add hosts to inventory


## Role: [create-zk-group](create-zk-group)
> **Task:** create zookeeper instances group

> **Task:** add hosts to inventory


## Role: [create-kdc-group](create-kdc-group)
> **Task:** create kerberos inventory group


## Role: [kerberos-setup](kerberos-setup)
> **Task:** update the hostname ( remove novalocal )

> **Task:** set managed host flag to false ( not to update /etc/hosts at system boot )

> **Task:** Commenting a line in /etc/hosts containing IPv6

> **Task:** Add IP address of all hosts to all hosts

> **Task:** Install Kerberos Server

> **Task:** copy the krb5 conf file

> **Task:** Create The Initial kerberos db

> **Task:** Create an admin for the administering the kerberos database

> **Task:** Start The krb5kdc service

> **Task:** Start The kadmin service


## Role: [packages](packages)
> **Task:** Install dependencies utilities

> **Task:** Install dependencies utilities


## Role: [attach-volume](attach-volume)
> **Task:** Attach the data volume

> **Task:** Wait for attach vol For Data to complete


## Role: [download-certs](download-certs)
> **Task:** download certs


## Role: [create-livy-group](create-livy-group)
> **Task:** create master instances group

> **Task:** add hosts to inventory


## Role: [mount-volume](mount-volume)
> **Task:** unmount the default volume in current host {{ansible_hostname}} which is created by OST

> **Task:** Creates directory

> **Task:** Create a ext4 filesystem on /dev/vdb for {{ansible_hostname}}

> **Task:** mount volume in current host {{ansible_hostname}}


## Role: [delete-volume](delete-volume)
> **Task:** Stop DFS service

> **Task:** Stop Yarn service

> **Task:** unmount the default volume in current host {{ansible_hostname}} which is created by OST

> **Task:** mount volume in current host {{ansible_hostname}}

> **Task:** Detach the data volume

> **Task:** Wait for detach vol For Data to complete

> **Task:** delete cinder volumes data

> **Task:** Wait for Cinder Vol Deletion For Data to complete


## Role: [create-router](create-router)
> **Task:** creating the router


## Role: [create-kdc-os-instance](create-kdc-os-instance)
> **Task:** launch instances for master

> **Task:** Wait for Master instance creation to complete

> **Task:** add hosts to inventory

> **Task:** Wait 30 Seconds to Spin Up All OST Instance (SSH)

> **Task:** Wait for SSH port to come up On newly created master clinet data and ingest OST instance


## Role: [create-keypair](create-keypair)
> **Task:** creating key


## Role: [cluster-decommission](cluster-decommission)
> **Task:** Delete instances for master

> **Task:** Delete instances for data

> **Task:** Delete instances for zookeeper

> **Task:** Delete instances for livy

> **Task:** Wait for zookeeper instance deletion to complete

> **Task:** Wait for Master instance deletion to complete

> **Task:** Wait for Data instance deletion to complete

> **Task:** Wait for Livy instance deletion to complete


## Role: [create-volume](create-volume)
> **Task:** create cinder volumes data

> **Task:** Wait for Cinder Vol Creation For Data to complete


## Role: [create-subnet](create-subnet)
> **Task:** creating the test subnet


## Role: [delete-dns](delete-dns)
> **Task:** fetch token for firing dns api

> **Task:** delete dns entry
