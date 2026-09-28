#!/bin/bash
yum -y update && yum -y upgrade
yum -y install ansible

cat<<"EOA" > config-and-deploy.web.yml
- hosts: localhost
  become: true

  tasks:

  - name: install nginx & git tool
    yum:
      name: "{{ packages }}"
      state: latest
      update_cache: yes
      lock_timeout: 180
    vars:
      packages:
      - nginx
      - git-core

  - name: start nginx
    service:
      name: nginx
      state: started
      enabled: yes

  - name: clone application code
    git:
      repo: 'https://github.com/nenemustafa/Hellome.git'
      dest: /tmp/hello-me
      clone: yes
      update: yes

  - name: install application code
    copy:
      src: /tmp/hello-me/heyme
      dest: /usr/share/nginx/html/index.html
      remote_src: yes
EOA

ansible-playbook -v config-and-deploy.web.yml
