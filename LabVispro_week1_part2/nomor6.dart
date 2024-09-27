import 'dart:io';

void main() {
  // Gaji pokok dan bonus
  const int gajiPokok = 4000000;
  const int bonus = 200000;

  // Menampilkan judul dengan gaya
  print("===================================");
  print("        Hitung Gaji Karyawan       ");
  print("===================================");

  // Meminta input jumlah jam kerja per minggu dari pengguna
  stdout.write('Masukkan jumlah jam kerja per minggu: ');
  String? input = stdin.readLineSync();

  // Memeriksa apakah input valid
  if (input != null) {
    int jamKerja = int.parse(input); // Mengonversi input ke integer

    // Menghitung gaji total dalam satu pernyataan if
    int gajiTotal = gajiPokok + (jamKerja > 40 ? bonus : 0);

    // Menampilkan hasil gaji total
    print('===================================');
    print('Gaji total karyawan: Rp $gajiTotal');
    print('===================================');
  } else {
    print('Input tidak valid.');
  }
}
