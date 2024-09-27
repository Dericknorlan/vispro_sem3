import 'dart:io'; // Mengimpor library dart:io untuk input/output melalui terminal.

void main() {
  // Harga per kilogram
  const int hargaApel = 5000; // Harga apel per kilogram
  const int hargaJeruk = 4000; // Harga jeruk per kilogram

  // Menggunakan print untuk header aplikasi
  print("==============================================");
  print("|                 Toko Buah                  |");
  print("==============================================");

  // Meminta input jumlah kilogram apel yang dibeli
  stdout.write("Masukkan jumlah kilogram apel yang dibeli: ");
  int kilogramApel = int.parse(stdin.readLineSync()!); // Membaca input dari pengguna

  // Meminta input jumlah kilogram jeruk yang dibeli
  stdout.write("Masukkan jumlah kilogram jeruk yang dibeli: ");
  int kilogramJeruk = int.parse(stdin.readLineSync()!); // Membaca input dari pengguna

  // Menghitung total harga
  int totalHarga = (kilogramApel * hargaApel) + (kilogramJeruk * hargaJeruk); // Menghitung total harga

  // Menampilkan total harga yang harus dibayar
  print("\n==============================================");
  print("Total harga yang harus dibayar: Rp $totalHarga"); // Menampilkan total tanpa format
  print("==============================================");
}
