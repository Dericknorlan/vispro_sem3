void main() {
  const int unitPerJam = 20; // jumlah barang yang dihasilkan per jam
  const int jamOperasiPerHari = 8; // jam operasi per hari
  const int hariKerjaPerMinggu = 5; // jumlah hari kerja dalam seminggu

  // Menghitung total barang yang dihasilkan dalam satu minggu
  int totalUnitPerHari = unitPerJam * jamOperasiPerHari;
  int totalUnitPerMinggu = totalUnitPerHari * hariKerjaPerMinggu;

  // Menampilkan hasil
  print('Total barang yang dihasilkan dalam satu minggu: $totalUnitPerMinggu unit');
}
