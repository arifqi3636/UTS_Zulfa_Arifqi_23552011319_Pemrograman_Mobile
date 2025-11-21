# UTS_Zulfa_Arifqi_23552011319_Pemrograman_Mobile

Soal:
1. Jelaskan perbedaan antara Cubit dan Bloc dalam arsitektur Flutter.
2. Mengapa penting memisahkan model data, logika bisnis, dan UI dalam Flutter?
3. Sebutkan dan jelaskan minimal tiga state yang mungkin digunakan dalam CartCubit beserta fungsinya.

Jawab:
1.✦ Cubit

Bagian dari library flutter_bloc

Mengelola state tunggal dengan cara yang sangat sederhana

Memiliki fungsi langsung yang mengubah state (misal: increment())

Tidak memerlukan event

Lebih ringan dan cocok untuk aplikasi kecil sampai menengah

✦ Bloc

Lebih kompleks dan lebih terstruktur

Menggunakan Event → Bloc → State

Cocok untuk aplikasi besar yang punya banyak flow

Separasi antara Event dan State membuat arsitektur lebih scalable

2. Kode lebih terorganisir dan mudah dibaca
Pemisahan folder (models/blocs/pages) membuat struktur aplikasi rapi.

Mudah diperbaiki dan dikembangkan
Jika UI berubah, logika tidak perlu disentuh.

Mendukung reusability (reuse)
Model dan Cubit dapat digunakan oleh berbagai halaman.

Memudahkan testing
Unit test dapat dilakukan pada Cubit tanpa harus testing UI.

3.1. CartInitial

State awal ketika keranjang masih kosong.

2. CartUpdated

State ketika ada perubahan di keranjang:

Produk ditambah

Produk dihapus

Quantity berubah

Total harga berubah

3. CartLoading (opsional tapi valid)

State ketika cart sedang memproses suatu tindakan (misal animasi loading).
