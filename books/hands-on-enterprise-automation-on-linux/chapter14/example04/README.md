# Instructions

Tested on:
- CentOS 7.6
- Ansible 2.8.4

Run this command:

    ansible-playbook -i hosts site.yml
    ansible-playbook -i hosts site.yml --skip-tags=notlegacy
