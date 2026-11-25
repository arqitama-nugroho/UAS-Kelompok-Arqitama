sha256sum ./recovery/payload.bin
tar -xOzf ./backup/payload_backup.tar.gz ./payload.bin | sha256sum

if [[ "$hash1" == "$hash2" ]]; then
  echo "COCOK"
else
  echo "TIDAK COCOK"
fi