# Instructions

Tested on:
- Ubuntu 18.04.2
- Ansible 2.8.4

Run this command:

    ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ''
    ssh-copy-id testhost1
    ssh-copy-id testhost2
    ansible-playbook -i hosts simple.yml
