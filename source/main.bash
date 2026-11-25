mkdir temp

fallocate -l 5M payload.bin
head -c 5M /dev/urandom > payload.bin

mkdir quarantine
mv payload.bin quarantine

mkdir backup
tar -czf payload_backup.tar.gz /quarantine

rm payload.bin

mkdir recovery
tar -xvzf /backup/payload_backup.tar.gz /recovery