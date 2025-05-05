import 'dart:io';
import 'dart:convert';

/// Book class to represent a book in the library
class Book {
  String id;
  String title;
  String author;
  String genre;
  bool isAvailable;

  /// Constructor for creating a new Book
  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    this.isAvailable = true,
  });

  /// Convert Book object to a Map for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'genre': genre,
      'isAvailable': isAvailable,
    };
  }

  /// Create a Book object from a Map (deserialization)
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      genre: json['genre'],
      isAvailable: json['isAvailable'],
    );
  }

  /// String representation of a Book
  @override
  String toString() {
    return 'ID: $id | Title: $title | Author: $author | Genre: $genre | Available: ${isAvailable ? "Yes" : "No"}';
  }
}

/// Library class to manage the collection of books
class Library {
  List<Book> books = [];

  /// Add a new book to the library
  void addBook(Book book) {
    books.add(book);
    print('\n✅ Book added successfully!');
  }

  /// Get all books in the library
  List<Book> getAllBooks() {
    return books;
  }

  /// Get a book by its ID
  Book? getBookById(String id) {
    try {
      return books.firstWhere((book) => book.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Search books by title, author, or genre
  List<Book> searchBooks(String query) {
    query = query.toLowerCase();
    return books.where((book) {
      return book.title.toLowerCase().contains(query) ||
          book.author.toLowerCase().contains(query) ||
          book.genre.toLowerCase().contains(query);
    }).toList();
  }

  /// Update a book's information
  bool updateBook(String id, Book updatedBook) {
    int index = books.indexWhere((book) => book.id == id);
    if (index != -1) {
      books[index] = updatedBook;
      return true;
    }
    return false;
  }

  /// Delete a book from the library
  bool deleteBook(String id) {
    int initialLength = books.length;
    books.removeWhere((book) => book.id == id);
    return books.length < initialLength;
  }

  /// Save library data to a JSON file
  void saveToFile(String filename) {
    try {
      final file = File(filename);
      final jsonData = books.map((book) => book.toJson()).toList();
      file.writeAsStringSync(jsonEncode(jsonData));
      print('\n✅ Library data saved to $filename');
    } catch (e) {
      print('\n❌ Error saving library data: $e');
    }
  }

  /// Load library data from a JSON file
  void loadFromFile(String filename) {
    try {
      final file = File(filename);
      if (file.existsSync()) {
        final jsonString = file.readAsStringSync();
        final jsonData = jsonDecode(jsonString) as List;
        books = jsonData.map((item) => Book.fromJson(item)).toList();
        print('\n✅ Library data loaded from $filename');
      } else {
        print('\n⚠️ File not found. Starting with an empty library.');
      }
    } catch (e) {
      print('\n❌ Error loading library data: $e');
    }
  }
}

/// LibraryApp class to handle the command-line interface
class LibraryApp {
  Library library = Library();
  final String dataFile = 'library_data.json';

  /// Constructor that loads existing data if available
  LibraryApp() {
    library.loadFromFile(dataFile);
  }

  /// Display the main menu options
  void displayMenu() {
    print('\n===== LIBRARY MANAGEMENT SYSTEM =====');
    print('1. View all books');
    print('2. Search for books');
    print('3. Add a new book');
    print('4. Update a book');
    print('5. Delete a book');
    print('6. Save and exit');
    print('======================================');
    print('Enter your choice (1-6): ');
  }

  /// Get user input with a prompt
  String getUserInput(String prompt) {
    stdout.write(prompt);
    return stdin.readLineSync() ?? '';
  }

  /// Display all books in the library
  void viewAllBooks() {
    final allBooks = library.getAllBooks();
    if (allBooks.isEmpty) {
      print('\n📚 The library is empty.');
    } else {
      print('\n📚 LIBRARY CATALOG:');
      for (var book in allBooks) {
        print(book);
      }
    }
  }

  /// Search for books by query
  void searchBooks() {
    final query = getUserInput('\nEnter search term (title, author, or genre): ');
    final results = library.searchBooks(query);
    
    if (results.isEmpty) {
      print('\n🔍 No books found matching "$query".');
    } else {
      print('\n🔍 SEARCH RESULTS:');
      for (var book in results) {
        print(book);
      }
    }
  }

  /// Add a new book to the library
  void addBook() {
    print('\n📝 ADD NEW BOOK:');
    final id = getUserInput('Enter ID: ');
    
    // Check if ID already exists
    if (library.getBookById(id) != null) {
      print('\n❌ A book with this ID already exists!');
      return;
    }
    
    final title = getUserInput('Enter title: ');
    final author = getUserInput('Enter author: ');
    final genre = getUserInput('Enter genre: ');
    
    final book = Book(
      id: id,
      title: title,
      author: author,
      genre: genre,
    );
    
    library.addBook(book);
  }

  /// Update an existing book
  void updateBook() {
    final id = getUserInput('\nEnter the ID of the book to update: ');
    final existingBook = library.getBookById(id);
    
    if (existingBook == null) {
      print('\n❌ No book found with ID: $id');
      return;
    }
    
    print('\n📝 UPDATE BOOK (leave blank to keep current value):');
    print('Current book: $existingBook');
    
    final title = getUserInput('New title [${existingBook.title}]: ');
    final author = getUserInput('New author [${existingBook.author}]: ');
    final genre = getUserInput('New genre [${existingBook.genre}]: ');
    final availabilityInput = getUserInput('Is available (yes/no) [${existingBook.isAvailable ? "yes" : "no"}]: ');
    
    final updatedBook = Book(
      id: id,
      title: title.isEmpty ? existingBook.title : title,
      author: author.isEmpty ? existingBook.author : author,
      genre: genre.isEmpty ? existingBook.genre : genre,
      isAvailable: availabilityInput.isEmpty 
          ? existingBook.isAvailable 
          : availabilityInput.toLowerCase() == 'yes',
    );
    
    if (library.updateBook(id, updatedBook)) {
      print('\n✅ Book updated successfully!');
    } else {
      print('\n❌ Failed to update book.');
    }
  }

  /// Delete a book from the library
  void deleteBook() {
    final id = getUserInput('\nEnter the ID of the book to delete: ');
    
    if (library.getBookById(id) == null) {
      print('\n❌ No book found with ID: $id');
      return;
    }
    
    final confirmation = getUserInput('Are you sure you want to delete this book? (yes/no): ');
    
    if (confirmation.toLowerCase() == 'yes') {
      if (library.deleteBook(id)) {
        print('\n✅ Book deleted successfully!');
      } else {
        print('\n❌ Failed to delete book.');
      }
    } else {
      print('\n⚠️ Deletion cancelled.');
    }
  }

  /// Run the library management application
  void run() {
    bool running = true;
    
    while (running) {
      displayMenu();
      final choice = getUserInput('');
      
      switch (choice) {
        case '1':
          viewAllBooks();
          break;
        case '2':
          searchBooks();
          break;
        case '3':
          addBook();
          break;
        case '4':
          updateBook();
          break;
        case '5':
          deleteBook();
          break;
        case '6':
          library.saveToFile(dataFile);
          print('\n👋 Thank you for using the Library Management System!');
          running = false;
          break;
        default:
          print('\n❌ Invalid choice. Please try again.');
      }
      
      if (running) {
        getUserInput('\nPress Enter to continue...');
      }
    }
  }
}

/// Main function to start the application
void main() {
  print('Welcome to the Library Management System!');
  final app = LibraryApp();
  app.run();
}