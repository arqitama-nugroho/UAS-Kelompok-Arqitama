#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/logger.bash"

RUN_DIR="${RUN_DIR:-$PWD}"
EVIDENCE_DIR="${EVIDENCE_DIR:-/evidence}"
mkdir -p "$EVIDENCE_DIR"

CHECK_LOG="$EVIDENCE_DIR/checker.log"
: > "$CHECK_LOG"
exec > >(tee -a "$CHECK_LOG") 2>&1

step "Verify backup and recovered payload"
[[ -f "$RUN_DIR/recovery/payload.bin" ]]
[[ -f "$RUN_DIR/backup/payload_backup.tar.gz" ]]

hash1="$(sha256sum "$RUN_DIR/recovery/payload.bin" | awk '{print $1}')"
hash2="$(tar -xOzf "$RUN_DIR/backup/payload_backup.tar.gz" payload.bin | sha256sum | awk '{print $1}')"

echo "hash1=$hash1"
echo "hash2=$hash2"

if [[ "$hash1" == "$hash2" ]]; then
  echo "COCOK"
  exit 0
else
  echo "TIDAK COCOK"
  exit 1
fi