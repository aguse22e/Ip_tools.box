# IP Toolbox Gabungan

Satu halaman web untuk cek IP, kecepatan internet, DNS, lokasi, izin browser,
pencarian, dan kumpulan repo data online. Dibuka lewat browser, tanpa instal
aplikasi. Semua proses jalan di sisi pengguna, tidak ada data yang dikirim ke
server mana pun.

## Fitur

- **Cek IP** — alamat IP publik, penyedia, kota, dan zona waktu.
- **Tes kecepatan** — unduh dari beberapa sumber, dengan batas waktu.
- **DNS lookup** — catatan A dan MX sebuah domain.
- **Lokasi dan pelacakan** — koordinat dari izin lokasi browser, lingkaran
  radius akurasi, dan klasifikasi radius (GPS 5–20 m, WiFi 20–100 m,
  pemancar kota 0,5–5 km, pemancar desa sampai 35 km).
- **Izin browser** — status lokasi, notifikasi, kamera, mikrofon, clipboard,
  dan penyimpanan, plus tombol cek dan minta izin.
- **Nomor HP** — ketik nomor sendiri, lalu dinormalisasi ke format +62/08,
  operator ditebak dari prefix, ada tautan wa.me dan tombol samarkan.
- **Mesin pencari** — DuckDuckGo dan Wikipedia secara paralel.
- **OSINT domain** — RDAP/WHOIS, subdomain dari crt.sh, DNS lewat Google DNS.
- **OSINT username** — tautan profil publik di GitHub, GitLab, X, Instagram,
  TikTok, YouTube, Reddit, LinkedIn, Medium, dan Pinterest.
- **Repo data online** — awesome-osint, awesome-osint-repos, OSINT Framework,
  SpiderFoot, Sherlock, dan Insight Orchestra. OSINT Framework dan Sherlock
  punya tombol Jalankan online; sisanya hanya tautan ke repo.

## Cara jalan

Paling gampang:

```bash
bash run.sh
```

Lalu buka http://localhost:8080. Tanpa Docker, skrip memakai Python
(`python3 -m http.server`). Dengan Docker:

```bash
docker compose up --build -d
```

Berhenti: `docker compose down`.

Bisa juga dibuka langsung sebagai berkas (`ip-toolbox.html` diklik dua kali),
tapi tes IP, kecepatan, dan DNS akan gagal karena browser memblokir
pengambilan data dari berkas lokal. Pakai HTTP atau versi web.

## Catatan

- Nomor HP tidak menentukan koordinat. Koordinat hanya dari izin lokasi
  browser; web tidak bisa membaca ID menara atau Cell ID.
- GPS laptop biasanya dari WiFi, akurasi 50–500 meter, tidak seakurat HP.
- Tombol samarkan hanya mengubah tampilan. Untuk menyamarkan koneksi
  sungguhan, pakai Tor Browser atau VPN (lihat `scripts/`).
- Halaman web tidak bisa memberi izin diam-diam; browser tetap menampilkan
  jendela persetujuan untuk lokasi, kamera, dan mikrofon.
- Kalkulator jarak ke menara sudah dihapus dari halaman ini.
