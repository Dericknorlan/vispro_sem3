void main() {
  // Daftar nama nasabah
  List<String> nasabah = ['A', 'B', 'C', 'D', 'E'];

  // Loket
  int loket = 1;
  int i = 0; // Inisialisasi indeks

  print('Urutan pelayanan nasabah di dua loket:');

  // Loop untuk menampilkan urutan pelayanan
  while (i < nasabah.length) {
    // Tentukan loket berdasarkan urutan
    if (loket == 1) {
      print('Nasabah ${nasabah[i]} dilayani di Loket 1');
      loket = 2; // Ubah loket untuk nasabah berikutnya
    } else {
      print('Nasabah ${nasabah[i]} dilayani di Loket 2');
      loket = 1; // Kembali ke loket 1
    }
    i++; // Increment indeks
  }
}
