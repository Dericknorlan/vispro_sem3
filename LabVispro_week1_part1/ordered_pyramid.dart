void printOrderedPyramid(List<int> numbers) {
  // Mengurutkan daftar angka terlebih dahulu
  numbers.sort();

  // Menggunakan panjang daftar angka sebagai tinggi piramida
  int height = numbers.length;
  int i = 0;

  while (i < height) {
    // Membuat string spasi untuk perataan piramida
    String spaces = ' ' * (height - i - 1);

    // Mengambil deretan angka sesuai dengan baris saat ini (baris ke-i) dan menggabungkannya menjadi string
    String numberLine = numbers.sublist(0, i + 1).join(' ');

    // Mencetak baris lengkap dengan spasi dan angka
    print(spaces + numberLine);

    i++;
  }
}
