import 'color.dart';
import 'linkedList.dart';
import 'dart:io';

void main() async {
  int delayDuration = 10; // Durasi delay yang lebih cepat
  clearScreen(); // Bersihkan layar
  moveTo(0, 0); // Pindahkan kursor ke posisi (0, 0)
  stdout.write("Masukkan nama: "); // Tampilkan prompt untuk input nama
  Node head = craft(stdin.readLineSync()!); // Buat linked list dari input
  clearScreen(); // Bersihkan layar setelah input
  moveTo(0, 0); // Pindahkan kursor ke posisi (0, 0)

  String selectedColor = RESET; // Set warna awal
  Node? node = head; // Mulai dengan head dari linked list
  bool isFirstIteration = true; // Menandakan apakah ini iterasi pertama

  // Infinite loop untuk terus menampilkan nama
  while (true) {
    // Pilih warna berdasarkan iterasi
    if (isFirstIteration) {
      stdout.write(selectedColor); // Warna putih untuk iterasi pertama
    } else {
      selectedColor =
          getRandomColor(selectedColor); // Warna acak untuk iterasi berikutnya
      stdout.write(selectedColor); // Terapkan warna baru
    }

    // Loop untuk menampilkan karakter dari linked list
    for (int j = 1; j <= getScreenSize()[1]; j++) {
      // Untuk setiap baris di layar terminal
      int start = (j % 2 != 0) ? 1 : getScreenSize()[0]; // Kolom awal
      int end = (j % 2 != 0) ? getScreenSize()[0] : 0; // Kolom akhir
      int increment = (j % 2 != 0) ? 1 : -1; // Arah pencetakan

      for (int i = start; (j % 2 != 0) ? (i <= end) : (i > end); i += increment) {
        moveTo(j, i); // Pindahkan kursor ke posisi (j, i)
        stdout.write(node!.data); // Tampilkan data dari node
        node = getNext(node)!; // Pindah ke node berikutnya
        await delay(delayDuration); // Delay sebelum melanjutkan
      }
    }
    isFirstIteration = false; // Ubah status iterasi setelah iterasi pertama
  }
}
