# Allow to SSH to host

First you have to enable SSH in your system. Then generate SSH key which will be copied into Dev Container. You need to add the to host so it's recognized.

> On your host machine, in key folder (it's in gitigore so don't worry) create ssh-docker key

1. ssh-keygen -t rsa
2. ssh-copy-id -i ssh-docker.pub $hostname
3. You need to tweak `config` to match your user and host
