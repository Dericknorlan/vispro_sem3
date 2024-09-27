import 'dart:io';

void main() {
  // Menampilkan judul dengan gaya
  print("===================================");
  print("     Konversi Suhu Celsius ke     ");
  print("           Fahrenheit              ");
  print("===================================");

  // Meminta input suhu dalam Celsius dari pengguna
  stdout.write('Masukkan suhu dalam Celsius: ');
  String? input = stdin.readLineSync();

  // Memeriksa apakah input valid
  if (input != null) {
    try {
      // Mengonversi input ke double
      double celsius = double.parse(input);
      
      // Menghitung suhu dalam Fahrenheit
      double fahrenheit = (9 / 5) * celsius + 32;

      // Menampilkan hasil konversi dengan format yang rapi
      print("\n$celsius°C = $fahrenheit°F");
    } catch (e) {
      print("\nInput tidak valid. Harap masukkan angka yang benar."); // Menangani input yang tidak valid
    }
  } else {
    print('Input tidak valid.');
  }

  // Menampilkan garis pemisah di akhir
  print("\n===================================");
  print("          Terima Kasih!           ");
  print("===================================\n");
}
