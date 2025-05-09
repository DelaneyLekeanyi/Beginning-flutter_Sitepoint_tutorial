// Dart program to perform basic arithmetic operations
// with user input and null safety for division
import 'dart:io';

void main() {
  print('===== CALCULATOR WITH NULL SAFETY =====');
  
  // Get first number from user
  //stdout is used to write output to the console
  //stdin is used to read input from the console
  stdout.write('Enter first number: ');
  double? num1 = getDoubleInput();
  
  // Get second number from user
  stdout.write('Enter second number: ');
  double? num2 = getDoubleInput();
  
  if (num1 == null || num2 == null) {
    print('Invalid input. Please enter valid numbers.');
    return;
  }
  
  print('\nChoose an operation:');
  print('1. Addition (+)');
  print('2. Subtraction (-)');
  print('3. Multiplication (*)');
  print('4. Division (/)');
  print('5. Perform all operations');
  stdout.write('Enter your choice (1-5): ');
  
  String? choice = stdin.readLineSync();
  print('');
  
  switch (choice) {
    case '1':
      double result = add(num1, num2);
      print('Addition: $num1 + $num2 = $result');
      break;
      
    case '2':
      double result = subtract(num1, num2);
      print('Subtraction: $num1 - $num2 = $result');
      break;
      
    case '3':
      double result = multiply(num1, num2);
      print('Multiplication: $num1 * $num2 = $result');
      break;
      
    case '4':
      // For division, we need to handle potential division by zero
      if (num2 == 0) {
        print('Cannot divide by zero!');
      } else {
        double result = divide(num1, num2);
        print('Division: $num1 / $num2 = $result');
      }
      break;
      
    case '5':
      // Perform all operations
      print('Numbers: $num1 and $num2');
      print('Addition: $num1 + $num2 = ${add(num1, num2)}');
      print('Subtraction: $num1 - $num2 = ${subtract(num1, num2)}');
      print('Multiplication: $num1 * $num2 = ${multiply(num1, num2)}');
      
      // Handle division separately to check for division by zero
      if (num2 == 0) {
        print('Division: Cannot divide by zero!');
      } else {
        print('Division: $num1 / $num2 = ${divide(num1, num2)}');
      }
      break;
      
    default:
      print('Invalid choice. Please enter a number between 1 and 5.');
  }
  
  // Ask if user wants to perform division with a custom divisor
  print('\nWould you like to perform division with a custom divisor? (y/n)');//
  //the readLineSync method is used to read a line of text from the standard input (stdin).
  //the toLowerCase method is used to convert the input string to lowercase.
  //this allows us to compare the input in a case-insensitive manner.
  String? response = stdin.readLineSync()?.toLowerCase();
  
  if (response == 'y' || response == 'yes') {
    stdout.write('Enter a divisor (or leave empty for null): ');
    String? input = stdin.readLineSync();
    
    if (input == null || input.isEmpty) {
      print('You entered a null/empty divisor.');
      double safeResult = divideWithNullCheck(num1, null);
      print('Safe division with null check: $num1 / (null → 1) = $safeResult');
    } else {
      try {
        double divisor = double.parse(input);
        if (divisor == 0) {
          print('Warning: Division by zero!');
          print('Result: Infinity');
        } else {
          double result = divide(num1, divisor);
          print('Division with custom divisor: $num1 / $divisor = $result');
        }

      } 
      // Handle invalid input for divisor
      // The catch block is used to handle exceptions that may occur during the execution of the try block.
      catch (e) {
        print('Invalid input. Using null-safe division.');
        double safeResult = divideWithNullCheck(num1, null);
        print('Safe division result: $safeResult');
      }
    }
  }
  
  print('\nThank you for using the calculator!');
}

// Function to safely get double input from user
double? getDoubleInput() {
  String? input = stdin.readLineSync();
  if (input == null || input.isEmpty) {
    return null;
  }
  
  try {
    return double.parse(input);
  } catch (e) {
    print('Invalid input. Please enter a valid number.');
    return null;
  }
}

// Function to add two numbers
double add(double a, double b) {
  return a + b;
}

// Function to subtract two numbers
double subtract(double a, double b) {
  return a - b;
}

// Function to multiply two numbers
double multiply(double a, double b) {
  return a * b;
}

// Function to divide two numbers
// The divisor parameter is non-nullable (cannot be null)
double divide(double a, double b) {
  // Check for division by zero
  if (b == 0) {
    print('Warning: Division by zero!');
    return double.infinity; // Return infinity for division by zero
  }
  return a / b;
}

// Function that might return null (for demonstration)
double? getNullableDivisor() {
  // Simulating a scenario where we might get null
  bool shouldReturnNull = false;
  return shouldReturnNull ? null : 4;
}

// Function that handles null values safely
double divideWithNullCheck(double a, double? b) {
  // Using null-aware operator to provide a default value if b is null
  return a / (b ?? 1); // If b is null, use 1 as the divisor
}
