import 'dart:math'; // Mengimpor library dart:math untuk menggunakan fungsi Random().
import 'dart:io'; // Mengimpor library dart:io untuk input/output melalui terminal.
import 'ordered_pyramid.dart'; // Mengimpor file ordered_pyramid.dart yang berisi fungsi printOrderedPyramid.
import 'unordered_pyramid.dart'; // Mengimpor file unordered_pyramid.dart yang berisi fungsi printUnorderedPyramid.

void main() {
  // Tampilan header aplikasi
  print("==============================================");
  print("|             Aplikasi abal-abal             |");
  print("==============================================\n");

  /// Input jumlah angka dari user
  stdout.write("Input jumlah angka yang ingin di-generate (max70): ");
  int count = int.parse(stdin.readLineSync()!); // Membaca input dari user dan mengonversinya ke integer.

  // Menggunakan switch untuk memeriksa jumlah angka yang diinginkan
  switch (count) {
    case var n when n > 70: // Jika angka lebih dari 80, batasi menjadi 80.
      print("Jumlah angka lebih dari 70, akan di-set menjadi 70.");
      count = 70;
      break;
    default:
      // Jika count kurang dari atau sama dengan 70, gunakan nilai input.
      break;
  }

  // Generate angka acak antara 1 sampai 9 sebanyak jumlah yang diminta
  List<int> numbers = List.generate(count, (index) => Random().nextInt(8) + 1); // Membuat daftar angka acak.
  print("Angka yang di-generate: $numbers\n");
  print("==============================================");

  // Pilihan fungsi yang tersedia
  print("Pilih fungsi: ");
  print("1. Bubble Sort");
  print("2. Inversi");
  print("3. Shuffle");
  // print("==============================================\n"); 

  // Input pilihan dari user
  stdout.write("Input pilihan Anda (1-3): ");
  int choice = int.parse(stdin.readLineSync()!); // Membaca input user dan mengonversinya ke integer.
  Stopwatch stopwatch = Stopwatch(); // Membuat stopwatch untuk mengukur waktu eksekusi.

  print("\n=============================================="); 

  // Switch case untuk mengeksekusi fungsi berdasarkan pilihan user
  switch (choice) {
    case 1:
      print("Angka sebelum Bubble Sort: $numbers."); // Menampilkan angka sebelum Bubble Sort
      stopwatch.start(); // Mulai menghitung waktu eksekusi.
      bubbleSort(numbers, numbers.length); // Memanggil fungsi Bubble Sort.
      stopwatch.stop(); // Menghentikan stopwatch.
      print("Hasil Bubble Sort: $numbers"); 
      print("Waktu eksekusi: ${stopwatch.elapsedMilliseconds} ms"); // Menampilkan waktu eksekusi.
      break;

    case 2:
      print("Angka sebelum Inversi: $numbers"); // Menampilkan angka sebelum inversi
      stopwatch.start();
      List<int> inverted = invert(numbers); // Membalik urutan daftar.
      stopwatch.stop();
      print("Hasil Inversi: $inverted");
      print("Waktu eksekusi: ${stopwatch.elapsedMilliseconds} ms");
      break;

    case 3:
      print("Angka sebelum Shuffle: $numbers"); // Menampilkan angka sebelum shuffle
      stopwatch.start();
      List<int> shuffled = shuffle(numbers); // Mengacak urutan daftar.
      stopwatch.stop();
      print("Hasil Shuffle: $shuffled");
      print("Waktu eksekusi: ${stopwatch.elapsedMilliseconds} ms");
      break;

    default:
      print("Pilihan tidak valid. Silakan coba lagi.");
      return; // Menghentikan program jika input tidak valid.
  }

  print("==============================================");
  
  // Minta input untuk mencetak piramida
  stdout.write("Apakah Anda ingin mencetak piramida? (ya/tidak): ");
  String? pyramidChoice = stdin.readLineSync(); // Membaca pilihan user untuk mencetak piramida.

  if (pyramidChoice?.toLowerCase() == 'ya') {
    // Jika user memilih 'ya', pilih jenis piramida.
    print("Pilih jenis piramida: ");
    print("1. Piramida Terurut");
    print("2. Piramida Tidak Terurut");

    stdout.write("Input pilihan Anda (1-2): ");
    int pyramidType = int.parse(stdin.readLineSync()!); // Membaca input user.

    switch (pyramidType) {
      case 1:
        // Cetak piramida terurut
        print("Piramida Terurut:");
        printOrderedPyramid(numbers); // Memanggil fungsi untuk mencetak piramida terurut.
        break;
      case 2:
        // Cetak piramida tidak terurut
        print("\nPiramida Tidak Terurut:");
        printUnorderedPyramid(numbers); // Memanggil fungsi untuk mencetak piramida tidak terurut.
        break;
      default:
        print("Pilihan tidak valid. Silakan coba lagi.");
        break;
    }
  }

  print("==============================================");
}

// Fungsi untuk mengurutkan menggunakan Bubble Sort
void bubbleSort(List<int> arr, int n) {
  (n <= 1) ? null : bubbleSortHelper(arr, n); // Jika n <= 1, tidak ada yang perlu diurutkan.
}

// Fungsi pembantu untuk Bubble Sort, yang secara rekursif memanggil dirinya
void bubbleSortHelper(List<int> arr, int n) {
  int j = 0;
  while (j < n - 1) {
    swap(arr, j); // Menukar elemen jika elemen saat ini lebih besar dari elemen berikutnya.
    j++;
  }
  bubbleSort(arr, n - 1); // Memanggil bubbleSort untuk ukuran yang lebih kecil.
}

// Fungsi untuk menukar dua elemen dalam daftar
void swap(List<int> arr, int index) {
  (arr[index] > arr[index + 1]) // Jika elemen pertama lebih besar dari elemen kedua, tukar posisinya.
      ? (
          arr[index] = arr[index] + arr[index + 1],
          arr[index + 1] = arr[index] - arr[index + 1],
          arr[index] = arr[index] - arr[index + 1]
        )
      : null; // Jika tidak, biarkan elemen di posisi aslinya.
}

// Fungsi untuk membalikkan urutan elemen dalam daftar
List<int> invert(List<int> arr) {
  return arr.reversed.toList(); // Menggunakan fungsi reversed untuk membalik urutan.
}

// Fungsi untuk mengacak urutan elemen dalam daftar
List<int> shuffle(List<int> arr) {
  List<int> shuffled = List.from(arr); // Membuat salinan daftar untuk diacak.
  shuffled.shuffle(); // Menggunakan fungsi shuffle untuk mengacak urutan elemen.
  return shuffled; // Mengembalikan daftar yang telah diacak.
}
