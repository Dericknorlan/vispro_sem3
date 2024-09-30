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
    books.removeWhere((book) => book.title == title);
    print('Removed book: "$title"');
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

  Book book1 = Book('saya', 'Orwell', 2000);
  Book book2 = Book('burung', 'Lee', 1960);
  Book book3 = Book('makan', 'scott', 3000);

  library.addBook(book1);
  library.addBook(book2);
  library.addBook(book3);

  library.displayBooks();

  library.removeBook('saya');

  library.displayBooks();
}
