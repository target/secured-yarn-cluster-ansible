# Changelog

## 2016-12-22: 3.0.2
  - Remove become / sudo from tasks

## 2016-12-20: 3.0.1
  - RedHat yum repo name to contain version

## 2016-12-20: 3.0.0
  - Default version `5.x`
  - Updated package repositories 
  - `filebeat_use_apt_repo` moved to `filebeat_use_repo`
  - Support to install from url for RedHat based systems

## 2016-09-07: 2.0.0
  - As of this release, support for ansible 1.x might be dropped
  - ES templates can be copied using `filebeat_templates` dict
  - Use `become` instead of `sudo`
  - Comply with ansible-lint

## 2016-07-28: 1.0.0
  - stable-1.x branch to provide backward compat for ansible 1.x users
  - tests to check filebeat installation based on url 
    (`filebeat_use_apt_repo: false`)

## 2016-07-11: 0.2.0
  - Support for Solaris (@kireevco)

## 2016-07-08: 0.1.1
  - Update CHANGELOG typos :)
  - Add documentation!

## 2016-03-18: 0.1.0

  - First release :)
  - default version: 1.1.1
  - Works on Debian like distros
  - Works on RedHat like distros

