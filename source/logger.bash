LOG_DIR="${LOG_DIR:-logs}"
mkdir -p "$LOG_DIR"
LOG_FILE="${LOG_FILE:-$LOG_DIR/run_$(date +%Y%m%d_%H%M%S).log}"

log() {
  local level="$1"; shift
  printf '[%s] [%-6s] %s\n' "$(date '+%F %T')" "$level" "$*" | tee -a "$LOG_FILE"
}

step() { log STEP "=== $* ==="; }

run() {
  log CMD "$*"
  local out rc=0
  out=$("$@" 2>&1) || rc=$?
  if [ -n "$out" ]; then
    while IFS= read -r line; do log OUT "$line"; done <<< "$out"
  fi
  if [ "$rc" -ne 0 ]; then
    log ERROR "gagal (exit=$rc): $*"
    exit "$rc"
  fi
  log OK "berhasil"
}

trap 'log ERROR "script berhenti di baris $LINENO (exit=$?)"' ERR
trap 'log INFO "script selesai, log: $LOG_FILE"' EXIT