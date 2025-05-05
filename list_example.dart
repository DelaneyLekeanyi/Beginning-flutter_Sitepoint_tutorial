// Example of working with lists in Dart

void main() {
  // Creating a list with different data types
  List<dynamic> info = ['John Doe', 30, 5.9, false];
  List<String> credentials = ['Name', 'Age', 'Height', 'Student'];
  
  print('Full info list: $info');
  
  // List splicing - accessing individual elements
  print('\nAccessing individual elements:');
  print('${info[0]}'); // John Doe
  print('${info[1]}'); // 30
  print('${info[2]}'); // 5.9
  print('${info[3]}'); // false
  
  // Printing every member of the list with proper labels
  print('\nPrinting with labels:');
  for (int i = 0; i < credentials.length; i++) {
    // Fixed: Using a different variable name for the inner loop
    print('${credentials[i]}: ${info[i]}');
  }
  
  // Alternative approach using forEach
  print('\nUsing forEach:');
  for (int i = 0; i < credentials.length; i++) {
    print('${credentials[i]}: ${info[i]}');
  }
}