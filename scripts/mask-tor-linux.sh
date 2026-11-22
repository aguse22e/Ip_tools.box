#!/bin/bash
# mask-tor-linux.sh - gaya PrivacyNet: arahkan semua traffic Linux lewat Tor
# PERINGATAN: baca dulu sebelum jalan. Butuh sudo, Tor terpasang, dan Linux.
# Script ini mengubah iptables. Aturan lama otomatis disimpan sebelum
# diubah dan dipulihkan saat stop (lihat BACKUP_FILE di bawah).
# Penggunaan:
#   sudo bash mask-tor-linux.sh start
#   sudo bash mask-tor-linux.sh stop
#   sudo bash mask-tor-linux.sh ip
set -e
BACKUP_DIR="/var/lib/mask-tor"
BACKUP_FILE="$BACKUP_DIR/rules.v4"
TOR_UID=$(id -u debian-tor 2>/dev/null || id -u tor 2>/dev/null || echo "")
if [ -z "$TOR_UID" ]; then echo "Tor belum terpasang atau user tor tidak ditemukan. Pasang dulu: sudo apt install tor"; exit 1; fi
if [ "$EUID" -ne 0 ]; then echo "Jalankan dengan sudo."; exit 1; fi
case "$1" in
  start)
    echo "Mengaktifkan Tor..."
    systemctl start tor
    sleep 3
    # Simpan aturan lama dulu (semua tabel) supaya bisa dipulihkan saat stop.
    # Hanya simpan bila belum ada backup — jangan menimpa backup asli dengan aturan Tor.
    mkdir -p "$BACKUP_DIR"
    if [ ! -f "$BACKUP_FILE" ]; then
      iptables-save > "$BACKUP_FILE" || echo "Peringatan: gagal menyimpan aturan firewall lama."
    fi
    iptables -F; iptables -t nat -F
    iptables -t nat -A OUTPUT -m owner --uid-owner "$TOR_UID" -j RETURN
    iptables -t nat -A OUTPUT -p udp --dport 53 -j REDIRECT --to-ports 5353
    iptables -t nat -A OUTPUT -p tcp --syn -j REDIRECT --to-ports 9040
    iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
    iptables -A OUTPUT -m owner --uid-owner "$TOR_UID" -j ACCEPT
    iptables -A OUTPUT -j REJECT
    echo "Aktif. Cek IP baru di IP Toolbox Gabungan."
    ;;
  stop)
    echo "Mematikan aturan Tor, kembali ke koneksi biasa..."
    if [ -f "$BACKUP_FILE" ]; then
      iptables-restore < "$BACKUP_FILE" && rm -f "$BACKUP_FILE" && echo "Aturan firewall lama dipulihkan dari $BACKUP_FILE."
    else
      echo "Peringatan: tidak ada backup aturan lama — membersihkan semua aturan."
      iptables -F; iptables -t nat -F
    fi
    systemctl stop tor || true
    echo "Selesai."
    ;;
  ip)
    curl -s https://api.ipify.org; echo
    ;;
  *)
    echo "Pakai: $0 {start|stop|ip}"
    exit 1
    ;;
esac
