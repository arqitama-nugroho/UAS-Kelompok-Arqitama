# SysGuard — To-Do & Rencana Acara

> Semester: SMT3 | Kualifikasi: UAS | Modul: Sistem Operasi / Keamanan

## Rencana Jadwal

| Tahap | Waktu | Fokus | Anggota |
|-------|-------|-------|---------|
| Tahap 1 | P10–P11 | Perencanaan, Akses Aman & Pondasi Script | 1, 2, 3, 4 |
| Tahap 2 | P12–P13 | Review Kemajuan, Container, Persistensi & Integrasi | 1–6 |
| Tahap 3 | P14–P16 | Resource Limit, Monitoring, Pengujian, Recovery & Dokumentasi | 4–6 |
| D1–D4 | Demonstrasi | Presentasi, Demo, Recovery | 1–6 |

---

## Tahap 1: Perencanaan, Akses Aman & Pondasi Script (P10–P11)

### Step 1.1 — Konsultasi & Kunci Pilihan C
**Anggota:** 1 & Semua Tim
Konsultasikan Pilihan C kepada dosen saat praktikum, lalu sepakati pembagian komponen host dan container. Pastikan seluruh alur hanya memakai data simulasi dan tidak menyentuh data sistem maupun data pribadi.

### Step 1.2 — Siapkan Repository & Struktur Folder
**Anggota:** 1
Buat satu repository utama lalu siapkan struktur folder awal termasuk source/ (berisi script, Dockerfile, konfigurasi contoh, data simulasi minimum, dan file pendukung) serta folder evidence/.

### Step 1.3 — Sepakati Kontrak Script & Alur Integrasi
**Anggota:** 1, 2 & 3
Samakan format log aktivitas, aturan validasi input, kode exit status saat sukses/gagal, serta kriteria file simulasi yang dipindahkan ke karantina dan diteruskan ke backup/restore.

### Step 1.4 — Pasang Akses Aman & Permission Folder
**Anggota:** 4
Konfigurasikan minimal satu mekanisme akses aman (SSH, SCP/SFTP, atau Samba) yang mendukung alur proyek. Atur ownership dan permission folder simulasi, karantina, dan backup tanpa menyertakan password, token, private key, atau credential di repository.

### Step 1.5 — Bangun Kerangka Modul 1
**Anggota:** 2
Tulis script pemeliharaan data persisten secara modular untuk memindai folder simulasi dan memindahkan file sesuai kriteria ke karantina, lengkap dengan validasi input, exit status, penanganan kegagalan, dan log. Sertakan konfigurasi contoh tanpa rahasia dan data simulasi minimum.

### Step 1.6 — Bangun Kerangka Modul 2
**Anggota:** 3
Tulis script backup dan restore secara modular dengan validasi input, exit status, penanganan kegagalan, dan log aktivitas yang seragam.

---

## Tahap 2: Review Kemajuan, Container, Persistensi & Integrasi (P12–P13)

### Step 2.1 — Siapkan & Ikuti Review Praktikum
**Anggota:** 1–6
Tunjukkan repository, alur kerja, minimal satu fungsi yang sudah berjalan, hasil uji awal, serta kendala saat review langsung di kelas. Catat masukan dosen untuk perbaikan sebelum lanjut.

### Step 2.2 — Tulis Dockerfile & Bangun Image
**Anggota:** 5
Buat Dockerfile dan bangun image untuk komponen yang sesuai. Jangan menggunakan privileged container atau memasang Docker socket ke container, dan pastikan image dapat dibangun kembali dari Dockerfile.

### Step 2.3 — Atur Persistensi & Network
**Anggota:** 5
Konfigurasikan volume atau bind mount serta network untuk container. Uji coba build, run, stop, dan pembuatan ulang (recreate) container lalu buktikan data tetap tersedia setelah container dibuat ulang.

### Step 2.4 — Hubungkan Modul ke Host/Container & Integrasikan Alur
**Anggota:** 2, 3 & 5
Sesuaikan path/konfigurasi agar Modul 1 dan Modul 2 berjalan mulus sesuai pembagian host/container. Lengkapi integrasi sehingga file simulasi yang memenuhi kriteria dipindah ke karantina, dicadangkan, dipulihkan (restore), dan diperiksa setelah container dibuat ulang.

---

## Tahap 3: Resource Limit, Monitoring, Pengujian, Recovery & Dokumentasi (P14–P16)

### Step 3.1 — Terapkan & Verifikasi Resource Limit
**Anggota:** 5
Atur batas CPU dan memori pada container, lalu periksa penerapannya agar batas sumber daya aktif berjalan.

### Step 3.2 — Uji Akses & Susun Recovery, Cleanup, Rollback
**Anggota:** 4
Jalankan uji akses yang diizinkan dan yang ditolak pada mekanisme akses aman dan permission folder. Susun serta uji prosedur recovery (saat pemeliharaan atau restore gagal), cleanup, dan rollback pada data simulasi.

### Step 3.3 — Jalankan Monitoring & Seluruh Skenario Uji
**Anggota:** 6
Pantau kondisi container dan log, lalu eksekusi pengujian: minimal 1 berhasil dan 1 gagal untuk tiap modul, 1 uji integrasi kedua modul, serta pengujian akses, persistensi setelah container dibuat ulang, resource limit, dan recovery.

### Step 3.4 — Kumpulkan Bukti Aktual ke Folder evidence/
**Anggota:** 6
Simpan log/transcript dan screenshot hasil pengujian aktual yang dirujuk pada laporan (pastikan tanpa credential/data sensitif dan tanpa mengarang output).

### Step 3.5 — Susun Dokumentasi & Bahan Presentasi
**Anggota:** 6
Tulis README.md (tujuan, kebutuhan lingkungan, arsitektur/pembagian host & container, instalasi, menjalankan, menguji, memantau, cleanup, dan rollback). Susun Laporan-Pengujian.pdf (identitas & pilihan proyek, ringkasan fungsi kedua modul, tabel pengujian dengan kolom ID uji | Modul/fitur | Kondisi/input | Hasil yang diharapkan | Hasil aktual | Status | Lokasi bukti, interpretasi hasil & keterbatasan, serta kontribusi tiap anggota) dan Slide-Presentasi.pdf (maksimal 8 slide).

### Step 3.6 — Finalisasi Repo, Tag & Submit Assignment P15
**Anggota:** 1
Pastikan isi folder source/ di ZIP sesuai dengan commit final di repository yang dapat diakses dosen. Buat tag final (P2-FINAL-v01), catat commit ID lengkap, periksa seluruh poin pemeriksaan sebelum submit, lalu unggah Kelas-KelompokXX-SysGuard-Final.zip dan lengkapi Online Text melalui Assignment P15 di LeADS (jangan tertinggal sebagai Draft).

---

## Langkah Eksekusi saat Demonstrasi / Sidang

### Langkah D1 — Paparan Arsitektur & Peran
Jelaskan tujuan serta alur kerja kedua modul, pembagian komponen host dan container, dan kontribusi tiap anggota.

### Langkah D2 — Demo Alur Berhasil & Integrasi
Jalankan pemindahan file simulasi ke karantina, backup, stop & recreate container, lalu restore dan verifikasi data.

### Langkah D3 — Demo Infrastruktur & Keamanan
Tunjukkan akses aman (diizinkan vs. ditolak), persistensi data, resource limit CPU & memori, serta monitoring container dan log.

### Langkah D4 — Demo Gagal & Recovery
Simulasikan satu kondisi gagal untuk memperlihatkan penanganan error/exit status dan langkah recovery, lalu jawab pertanyaan atau jalankan/diagnosis bagian tertentu secara individual bila diminta dosen.
