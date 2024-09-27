import 'dart:io'; // Mengimpor library dart:io untuk input/output melalui terminal.

void main() {
  const double pi = 3.14; // Nilai π (pi)
  
  // Menampilkan judul dengan gaya
  print("===================================");
  print("    Kalkulator Luas Lingkaran      ");
  print("===================================");

  // Meminta input diameter lingkaran dari pengguna
  stdout.write("Masukkan diameter lingkaran: ");
  String? input = stdin.readLineSync(); // Membaca input dari pengguna

  // Menangani kesalahan input
  try {
    double diameter = double.parse(input!); // Mengonversi input menjadi double
    if (diameter < 0) {
      print("\n Diameter tidak bisa negatif. Silakan coba lagi."); // Validasi input negatif
    } else {
      double radius = diameter / 2; // Menghitung radius
      double luas = pi * radius * radius; // Menghitung luas lingkaran
      print("\nLuas lingkaran diameter $diameter adalah: ${luas.toStringAsFixed(2)}"); // Menampilkan luas
    }
  } catch (e) {
    print("\n Input tidak valid. Harap masukkan angka yang benar."); // Menangani input yang tidak valid
  }

  // Menampilkan garis pemisah di akhir
  print("\n===================================");
  print("          Terima Kasih!           ");
  print("===================================\n");
}
