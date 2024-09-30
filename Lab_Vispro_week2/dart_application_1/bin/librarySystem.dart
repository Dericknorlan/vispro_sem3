import 'dart:io';

class Book {
  String title;
  String author;
  int year;

  Book(this.title, this.author, this.year);

  String display() {
    return '$title by $author, published in $year';
  }
}

class Library {
  List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
    print('Added: ${book.display()}');
  }

  void removeBook(String title) {
    // Attempt to find the book by title
    int initialLength = books.length;
    
    books.removeWhere((book) => book.title == title);

    // Check if a book was removed by comparing the length of the list
    if (books.length < initialLength) {
      print('Removed book: "$title"');
    } else {
      print('Book with title "$title" not found in the library.');
    }
  }

  void displayBooks() {
    if (books.isEmpty) {
      print('No books in the library.');
    } else {
      print('Books in the library:');
      for (var book in books) {
        print(book.display());
      }
    }
  }
}

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
