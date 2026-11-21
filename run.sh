#!/bin/bash
# run.sh - SATU MESIN SIAP PAKAI. Tinggal jalan, tidak perlu setting.
# Pakai: bash run.sh
# Buka: http://localhost:8080
set -e
cd "$(dirname "$0")"
PORT="${PORT:-8080}"
echo "IP Toolbox Gabungan - mesin siap pakai"
echo "Port: $PORT"
if command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1; then
  echo "Jalan lewat Docker..."
  docker compose up --build -d
  echo "Jalan di http://localhost:$PORT"
  echo "Berhenti: docker compose down"
  exit 0
fi
if command -v python3 >/dev/null 2>&1; then
  echo "Jalan lewat Python (tanpa Docker)..."
  echo "Buka http://localhost:$PORT - tekan Ctrl+C untuk berhenti"
  python3 -m http.server "$PORT"
  exit 0
fi
echo "Butuh Docker atau Python3. Buka langsung ip-toolbox.html di browser sebagai cadangan."
exit 1
