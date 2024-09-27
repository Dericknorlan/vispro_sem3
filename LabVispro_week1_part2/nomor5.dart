import 'dart:io';

void main() {
  // Menampilkan judul dengan gaya
  print("===================================");
  print("       Hitung Biaya Parkir        ");
  print("===================================");

  // Meminta input jumlah jam parkir dari pengguna
  stdout.write('Masukkan jumlah jam parkir: ');
  String? input = stdin.readLineSync();

  // Memeriksa apakah input valid
  if (input != null) {
    int jamParkir = int.parse(input); // Mengonversi input ke integer
    int totalBiaya = (jamParkir <= 2) ? (jamParkir * 2000) : (4000 + ((jamParkir - 2) * 1000)); // Menghitung total biaya parkir

    // Menampilkan hasil total biaya parkir
    print('===================================');
    print('Total biaya parkir: Rp $totalBiaya');
    print('===================================');
  } else {
    print('Input tidak valid.');
  }
}
