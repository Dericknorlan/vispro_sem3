import 'dart:io'; // Mengimpor library untuk input/output
import 'dart:math'; // Mengimpor library untuk menghasilkan angka acak
import 'dart:async'; // Mengimpor library untuk asynchronous programming
import 'color.dart'; // Mengimpor file eksternal yang berisi konstanta warna

// Kelas Node untuk Linked List
class Node {
  String? data; // Data yang disimpan dalam node
  Node? next; // Pointer ke node berikutnya

  Node(this.data); // Constructor untuk inisialisasi node dengan data
}

// Fungsi untuk memberikan delay
Future<void> delay(int milliseconds) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}

// Fungsi untuk memindahkan kursor ke baris dan kolom tertentu
void moveTo(int row, int col) {
  stdout.write('\x1B[${row};${col}H'); // Mengatur posisi kursor di terminal
}

// Fungsi untuk mendapatkan ukuran layar terminal
List<int> getScreenSize() {
  return [stdout.terminalColumns, stdout.terminalLines]; // Mengembalikan lebar dan tinggi terminal
}

// Fungsi untuk membersihkan layar terminal
void clearScreen() {
  print("\x1B[2J\x1B[0;0H"); // Membersihkan seluruh layar dan memindahkan kursor ke posisi (0, 0)
}

// Fungsi untuk menyisipkan node pada posisi tertentu di linked list
Node insertNodeAtPosition(Node head, Node newNode, int position) {
  // Jika posisi yang dimasukkan adalah pertama (head), update newNode menjadi head
  if (position == 1) {
    newNode.next = head; // Node baru akan menjadi head
    return newNode; // Kembalikan node baru sebagai head
  }

  Node? currentNode = head; // Node saat ini untuk traversal
  int i = 1;

  // Traverse ke posisi sebelumnya
  if (position != 0) {
    while (currentNode!.next != null && i < position - 1) {
      currentNode = currentNode.next; // Pindah ke node berikutnya
      i++;
    }
  } else {
    // Jika posisi 0, teruskan hingga akhir
    while (currentNode!.next != null) {
      currentNode = currentNode.next; // Pindah ke node berikutnya
      i++;
    }
  }

  // Sisipkan node baru di posisi yang ditarget
  newNode.next = currentNode.next; // Menghubungkan node baru ke node setelahnya
  currentNode.next = newNode; // Menghubungkan node sebelumnya ke node baru

  return head; // Mengembalikan head yang baru
}

// Fungsi untuk mengaktifkan loop pada linked list
Node activateLoop(Node head) {
  Node? currentNode = head; // Node saat ini untuk traversal
  while (currentNode!.next != null) {
    currentNode = currentNode.next; // Pindah ke node berikutnya
  }
  currentNode.next = head; // Membuat loop di linked list
  return head; // Mengembalikan head yang tidak berubah
}

// Fungsi untuk membuat linked list dari string input
Node craft(String text) {
  var pattern = RegExp(r"^\s+$"); // Pola untuk memeriksa apakah string kosong
  Node head = Node(text[0]); // Membuat head dengan karakter pertama dari input
  if (!pattern.hasMatch(text)) { // Jika input tidak kosong
    for (int i = 1; i < text.length; i++) {
      // Jika karakter tidak kosong, sisipkan ke linked list
      if (!pattern.hasMatch(head.data!)) {
        if (!pattern.hasMatch(text[i])) {
          insertNodeAtPosition(head, Node(text[i]), 0); // Sisipkan karakter ke linked list
        }
      } else {
        head = Node(text[i]); // Jika head kosong, buat node baru
      }
    }
  } else {
    head = Node("?"); // Jika string kosong, set head ke "?"
  }
  activateLoop(head); // Aktifkan loop pada linked list
  return head; // Kembalikan head linked list
}

// Fungsi untuk mendapatkan node berikutnya
Node? getNext(Node node) {
  return node.next; // Mengembalikan node berikutnya
}

// Fungsi untuk mendapatkan warna acak
String getRandomColor(String exception) {
  List<String> colors = [RED, GREEN, YELLOW, BLUE, MAGENTA, CYAN]; // Daftar warna
  colors.remove(exception); // Hapus warna yang sudah digunakan
  String selectedColor = colors[Random().nextInt(colors.length)]; // Pilih warna acak
  return selectedColor; // Kembalikan warna yang dipilih
}