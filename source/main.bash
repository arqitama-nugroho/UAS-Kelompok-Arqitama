mkdir -p temp
cd temp

fallocate -l 5M payload.bin
head -c 5M /dev/urandom > payload.bin

cd ..

mkdir -p quarantine
mv temp/payload.bin quarantine/

mkdir -p backup
tar -czf ./backup/payload_backup.tar.gz -C ./quarantine .

rm -f ./quarantine/payload.bin

mkdir -p recovery
tar -xvzf ./backup/payload_backup.tar.gz -C ./recovery