#!/usr/bin/env bash
set -euo pipefail

EVIDENCE_DIR="${EVIDENCE_DIR:-/evidence}"
mkdir -p "$EVIDENCE_DIR"
LOG_FILE="${LOG_FILE:-$EVIDENCE_DIR/run_$(date +%Y%m%d_%H%M%S).log}"
export LOG_FILE

log() {
  local level="$1"
  shift
  printf '[%s] [%-6s] %s\n' "$(date '+%F %T')" "$level" "$*" | tee -a "$LOG_FILE"
}

step() {
  log STEP "=== $* ==="
}

run() {
  log CMD "$*"
  local out rc=0
  out=$("$@" 2>&1) || rc=$?
  if [[ -n "$out" ]]; then
    while IFS= read -r line; do
      log OUT "$line"
    done <<< "$out"
  fi
  if [[ "$rc" -ne 0 ]]; then
    log ERROR "failed (exit=$rc): $*"
    return "$rc"
  fi
  log OK "succeeded"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  step "Fallback logger execution"
  log INFO "Host: $(hostname) | User: $(id -un)"
  log INFO "Evidence dir: $EVIDENCE_DIR"
fi