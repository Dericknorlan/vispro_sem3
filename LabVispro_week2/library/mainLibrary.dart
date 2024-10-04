import 'dart:io';
import 'librarySystem.dart';

void main() {
  Library library = Library();

  // Creating some book instances
  Book book1 = Book('saya', 'Orwell', 2000);
  Book book2 = Book('burung', 'Lee', 1960);
  Book book3 = Book('makan', 'Scott', 3000);

  // Adding books to the library
  library.addBook(book1);
  library.addBook(book2);
  library.addBook(book3);

  // Displaying all books in the library
  library.displayBooks();

  // Asking user for the title of the book to remove
  stdout.write('Enter the title of the book you want to remove: ');
  String titleToRemove = stdin.readLineSync()!.trim();

  // Removing the book based on user input
  library.removeBook(titleToRemove);

  // Displaying all books after removal
  library.displayBooks();
}
