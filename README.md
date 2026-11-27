# Overview

Jelasin overview disini

## Demonstration Steps (PowerShell)

### Build Image

docker rm -f uas-os
docker build --no-cache -t uas-os .
docker run -d --name uas-os -p 2222:22 -v uas-os_keys:/etc/ssh -v uas-os_homes:/home uas-os

### Create ssh key

ssh-keygen -R "[localhost]:2222"

### Create Account

docker exec -u 0 uas-os useradd -m -s /bin/bash -G root (username)
docker exec -u 0 uas-os bash -c "echo (username):(password) | chpasswd"
docker exec -u 0 uas-os chown -R (username):root /home/(username)
docker exec -u 0 uas-os chmod 1777 /evidence

### Log In

ssh -p 2222 (username)@localhost

### Run Test

Inside Container:
test-run
