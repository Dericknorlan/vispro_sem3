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