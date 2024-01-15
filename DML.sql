-- Menampilkan semua data dari tabel
SELECT * FROM umkm_jabar;

-- Menampilkan nama provinsi, nama kabupaten/kota, dan kategori usaha untuk tahun 2020
SELECT nama_provinsi, nama_kabupaten_kota, kategori_usaha, tahun
FROM umkm_jabar
WHERE tahun = '2020';

-- Menampilkan jumlah umkm berdasarkan kategori usaha untuk tahun 2020
SELECT kategori_usaha, SUM(proyeksi_jumlah_umkm) AS total_umkm
FROM umkm_jabar
WHERE tahun = '2020'
GROUP BY kategori_usaha;

-- Menampilkan rata-rata proyeksi jumlah umkm untuk setiap tahun
SELECT tahun, AVG(proyeksi_jumlah_umkm) AS rata_rata_umkm
FROM umkm_jabar
GROUP BY tahun;

-- Menampilkan data umkm untuk KABUPATEN BEKASI:
SELECT *
FROM umkm_jabar
WHERE nama_kabupaten_kota = 'KABUPATEN BEKASI';

-- Menampilkan data umkm yang memiliki jumlah proyeksi lebih dari 1000 untuk tahun 2020
SELECT *
FROM umkm_jabar
WHERE tahun = '2020' AND proyeksi_jumlah_umkm > 1000;

-- Menampilkan tahun dengan jumlah umkm terbanyak
SELECT tahun, SUM(proyeksi_jumlah_umkm) AS total_umkm
FROM umkm_jabar
GROUP BY tahun
ORDER BY total_umkm DESC
LIMIT 1;

-- Menampilkan data umkm yang memiliki jumlah tertinggi di setiap kabupaten/kota
SELECT *
FROM umkm_jabar u
WHERE proyeksi_jumlah_umkm = (SELECT MAX(proyeksi_jumlah_umkm) FROM umkm_jabar WHERE nama_kabupaten_kota = u.nama_kabupaten_kota);

-- Menampilkan data umkm yang ada ditahun antara 2020 dan 2022 dari kota bukan kabupaten
SELECT * FROM umkm_jabar
WHERE nama_kabupaten_kota LIKE 'KOTA%' AND tahun BETWEEN 2020 AND 2022;

-- Menampilkan kabupaten/kota yang memiliki rata2 jumlah proyeksi umkm diatas 40000
SELECT nama_kabupaten_kota, AVG(proyeksi_jumlah_umkm) as rata_rata_umkm
FROM umkm_jabar
GROUP BY nama_kabupaten_kota
HAVING AVG(proyeksi_jumlah_umkm) > 40000;


