void printUnorderedPyramid(List<int> numbers) {
  // Mengacak urutan angka untuk membuat piramida yang tidak terurut
  numbers.shuffle();

  // Menggunakan panjang daftar angka sebagai tinggi piramida
  int height = numbers.length;
  int i = 0;

  while (i < height) {
    // Membuat string spasi untuk perataan piramida
    String spaces = ' ' * (height - i - 1);

    // Mengambil sejumlah angka sesuai dengan baris saat ini (baris ke-i) dan menggabungkannya menjadi string
    String numberLine = numbers.sublist(0, i + 1).join(' ');

    // Mencetak baris lengkap dengan spasi dan angka
    print(spaces + numberLine);

    i++;
  }
}
