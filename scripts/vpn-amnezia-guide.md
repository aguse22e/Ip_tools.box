# Panduan VPN Self-Hosted (Amnezia)

Cara paling fleksibel menyamarkan IP: VPN di server sendiri, bukan VPN gratis acak.

## Pilihan

1. **Amnezia VPN** - paling mudah untuk pemula. Satu klik pasang di server, dukung WireGuard, OpenVPN, IKEv2, AmneziaWG, plus obfuscation untuk jaringan yang memblokir VPN.
   - Situs: https://amnezia.org
   - Repo: cari `amnezia-vpn/amnezia-client` di GitHub
2. **WireGuard** - paling cepat dan ringan. Cocok kalau sudah punya VPS.
3. **OpenVPN** - paling umum, banyak tutorial, lebih berat dari WireGuard.

## Langkah singkat Amnezia

1. Siapkan VPS (Oracle Always Free, atau VPS murah). Catat IP publiknya.
2. Pasang Amnezia Client di laptop atau HP.
3. Di Amnezia, pilih Set up your own server, masukkan IP VPS, user, dan kunci SSH atau kata sandi.
4. Amnezia memasang server otomatis di VPS.
5. Pilih protokol WireGuard dulu. Kalau diblokir jaringan, coba AmneziaWG.
6. Sambungkan, lalu buka IP Toolbox Gabungan dan cek IP berubah ke IP VPS.

## Cek setelah sambung

- IP di hero berubah ke IP server
- Negara dan ISP berubah ke lokasi server
- Tes WebRTC di alat ini: IP WebRTC harus sama dengan IP VPN, bukan IP rumah

## Peringatan

- VPN menyamarkan IP dari situs, bukan membuat anonim total. Penyedia VPS tetap tahu IP aslimu.
- Jangan pakai VPN gratis acak untuk login bank, email kerja, atau akun penting. Banyak yang mencatat traffic.
- Matikan VPN saat akses layanan yang memblokir VPN, seperti beberapa bank.
