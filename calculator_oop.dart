/*
 * File: calculator_oop.dart
 * Description: A calculator application implemented using object-oriented programming in Dart
 * Features:
 *  - Basic arithmetic operations (addition, subtraction, multiplication, division)
 *  - User input with validation
 *  - Null safety handling
 *  - Division by zero protection
 *  - Custom divisor option
 */

// Import the IO library for user input/output operations
import 'dart:io';

/*
 * Main function - entry point of the application
 * Instantiates the Calculator and UserInterface classes
 * and starts the calculator application
 */
void main() {
  // Create instances of our classes
  final Calculator calculator = Calculator();
  final UserInterface ui = UserInterface();
  final CalculatorApp app = CalculatorApp(calculator, ui);
  
  // Run the calculator application
  app.run();
}

/*
 * CalculatorApp class
 * Coordinates between the Calculator and UserInterface classes
 * Manages the overall flow of the application
 */
class CalculatorApp {
  // Private fields for calculator and UI instances
  final Calculator _calculator;
  final UserInterface _ui;
  
  // Constructor requiring calculator and UI instances
  CalculatorApp(this._calculator, this._ui);
  
  // Main method to run the calculator application
  void run() {
    _ui.displayWelcome();
    
    // Get the first number from user
    final double? num1 = _ui.getNumberInput('Enter first number: ');
    
    // Get the second number from user
    final double? num2 = _ui.getNumberInput('Enter second number: ');
    
    // Validate input before proceeding
    if (num1 == null || num2 == null) {
      _ui.displayMessage('Invalid input. Please enter valid numbers.');
      return;
    }
    
    // Display operation menu and get user choice
    final String? choice = _ui.getOperationChoice();
    _ui.displayMessage(''); // Empty line for better formatting
    
    // Process the user's choice
    _processChoice(choice, num1, num2);
    
    // Offer custom divisor option
    _offerCustomDivisor(num1);
    
    // Display goodbye message
    _ui.displayMessage('\nThank you for using the calculator!');
  }
  
  // Private method to process the user's operation choice
  void _processChoice(String? choice, double num1, double num2) {
    switch (choice) {
      case '1': // Addition
        final double result = _calculator.add(num1, num2);
        _ui.displayMessage('Addition: $num1 + $num2 = $result');
        break;
        
      case '2': // Subtraction
        final double result = _calculator.subtract(num1, num2);
        _ui.displayMessage('Subtraction: $num1 - $num2 = $result');
        break;
        
      case '3': // Multiplication
        final double result = _calculator.multiply(num1, num2);
        _ui.displayMessage('Multiplication: $num1 * $num2 = $result');
        break;
        
      case '4': // Division
        // Handle division by zero
        if (num2 == 0) {
          _ui.displayMessage('Cannot divide by zero!');
        } else {
          final double result = _calculator.divide(num1, num2);
          _ui.displayMessage('Division: $num1 / $num2 = $result');
        }
        break;
        
      case '5': // All operations
        _performAllOperations(num1, num2);
        break;
        
      default:
        _ui.displayMessage('Invalid choice. Please enter a number between 1 and 5.');
    }
  }
  
  // Private method to perform all operations at once
  void _performAllOperations(double num1, double num2) {
    _ui.displayMessage('Numbers: $num1 and $num2');
    _ui.displayMessage('Addition: $num1 + $num2 = ${_calculator.add(num1, num2)}');
    _ui.displayMessage('Subtraction: $num1 - $num2 = ${_calculator.subtract(num1, num2)}');
    _ui.displayMessage('Multiplication: $num1 * $num2 = ${_calculator.multiply(num1, num2)}');
    
    // Handle division separately to check for division by zero
    if (num2 == 0) {
      _ui.displayMessage('Division: Cannot divide by zero!');
    } else {
      _ui.displayMessage('Division: $num1 / $num2 = ${_calculator.divide(num1, num2)}');
    }
  }
  
  // Private method to offer and handle custom divisor option
  void _offerCustomDivisor(double num1) {
    _ui.displayMessage('\nWould you like to perform division with a custom divisor? (y/n)');
    final String? response = _ui.getInput()?.toLowerCase();
    
    if (response == 'y' || response == 'yes') {
      _ui.displayPrompt('Enter a divisor (or leave empty for null): ');
      final String? input = _ui.getInput();
      
      if (input == null || input.isEmpty) {
        _ui.displayMessage('You entered a null/empty divisor.');
        final double safeResult = _calculator.divideWithNullCheck(num1, null);
        _ui.displayMessage('Safe division with null check: $num1 / (null → 1) = $safeResult');
      } else {
        try {
          final double divisor = double.parse(input);
          if (divisor == 0) {
            _ui.displayMessage('Warning: Division by zero!');
            _ui.displayMessage('Result: Infinity');
          } else {
            final double result = _calculator.divide(num1, divisor);
            _ui.displayMessage('Division with custom divisor: $num1 / $divisor = $result');
          }
        } catch (e) {
          _ui.displayMessage('Invalid input. Using null-safe division.');
          final double safeResult = _calculator.divideWithNullCheck(num1, null);
          _ui.displayMessage('Safe division result: $safeResult');
        }
      }
    }
  }
}

/*
 * Calculator class
 * Responsible for performing arithmetic operations
 * Implements methods for addition, subtraction, multiplication, and division
 * Includes null safety handling for division
 */
class Calculator {
  // Method to add two numbers
  double add(double a, double b) {
    return a + b;
  }
  
  // Method to subtract two numbers
  double subtract(double a, double b) {
    return a - b;
  }
  
  // Method to multiply two numbers
  double multiply(double a, double b) {
    return a * b;
  }
  
  // Method to divide two numbers
  // The divisor parameter is non-nullable (cannot be null)
  double divide(double a, double b) {
    // Check for division by zero
    if (b == 0) {
      return double.infinity; // Return infinity for division by zero
    }
    return a / b;
  }
  
  // Method that handles null values safely for division
  double divideWithNullCheck(double a, double? b) {
    // Using null-aware operator to provide a default value if b is null
    return a / (b ?? 1); // If b is null, use 1 as the divisor
  }
}

/*
 * UserInterface class
 * Handles all user interaction including:
 * - Displaying messages to the user
 * - Getting input from the user
 * - Validating user input
 */
class UserInterface {
  // Method to display a welcome message
  void displayWelcome() {
    displayMessage('===== CALCULATOR WITH NULL SAFETY =====');
  }
  
  // Method to display a message to the user
  void displayMessage(String message) {
    print(message);
  }
  
  // Method to display a prompt without a newline
  void displayPrompt(String prompt) {
    stdout.write(prompt);
  }
  
  // Method to get raw input from the user
  String? getInput() {
    return stdin.readLineSync();
  }
  
  // Method to get a number input from the user with a prompt
  double? getNumberInput(String prompt) {
    displayPrompt(prompt);
    final String? input = getInput();
    
    if (input == null || input.isEmpty) {
      return null;
    }
    
    try {
      return double.parse(input);
    } catch (e) {
      displayMessage('Invalid input. Please enter a valid number.');
      return null;
    }
  }
  
  // Method to display operation menu and get user choice
  String? getOperationChoice() {
    displayMessage('\nChoose an operation:');
    displayMessage('1. Addition (+)');
    displayMessage('2. Subtraction (-)');
    displayMessage('3. Multiplication (*)');
    displayMessage('4. Division (/)');
    displayMessage('5. Perform all operations');
    displayPrompt('Enter your choice (1-5): ');
    
    return getInput();
  }
}