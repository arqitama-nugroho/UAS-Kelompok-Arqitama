#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/logger.bash"

RUN_DIR="${RUN_DIR:-$PWD}"
EVIDENCE_DIR="${EVIDENCE_DIR:-/evidence}"
mkdir -p "$RUN_DIR" "$EVIDENCE_DIR"

MAIN_LOG="$EVIDENCE_DIR/main.log"
: > "$MAIN_LOG"
exec > >(tee -a "$MAIN_LOG") 2>&1

step "Start main workflow in $RUN_DIR"
cd "$RUN_DIR"

mkdir -p temp quarantine backup recovery
head -c 5M /dev/urandom > temp/payload.bin
mv temp/payload.bin quarantine/payload.bin
tar -czf backup/payload_backup.tar.gz -C quarantine payload.bin
rm -f quarantine/payload.bin
tar -xzf backup/payload_backup.tar.gz -C recovery

ls -lh quarantine backup recovery
log OK "main.bash completed"