#!/usr/bin/env bash
set -euo pipefail

WORK_DIR="${1:-/home/kimi/work}"
SRC_DIR="/home/kimi/source"

# self-heal: strip Windows CRLF from scripts before running them
sed -i 's/\r$//' "$SRC_DIR"/*.bash 2>/dev/null || true

mkdir -p "$WORK_DIR"
cd "$WORK_DIR"

source "$SRC_DIR/logger.bash"

step "Run main.bash"
run bash "$SRC_DIR/main.bash"

step "Run checker.bash"
run bash "$SRC_DIR/checker.bash"