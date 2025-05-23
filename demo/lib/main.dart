// this is the import statement for the math library
import 'sci-cal.dart';
import 'notes.dart';

import 'package:flutter/material.dart'; // this is the import statement for the Flutter material library

void main() {
  runApp(const MyApp());// this is the main function that runs the app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {// THIS IS THE BUILD METHOD THAT BUILDS THE APP
    // The build method returns a MaterialApp widget that serves as the root of the app
    // The MaterialApp widget provides a number of features, including theming, routing, and localization
    return MaterialApp( // this is the MaterialApp widget
      // The MaterialApp widget has a number of properties that can be set  to customize the app
      // The home property specifies the widget that should be displayed when the app is launched
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 55, 57, 37)),
      ),
      home: const MyHomePage(title: 'Simple Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Controller for the first number input field
  final TextEditingController _firstNumberController = TextEditingController(); // this is the controller for the first number input field. A controller is an object that can be used to control the text being edited in a TextField widget. It allows you to read the current value of the text field, set a new value, and listen for changes to the text field's value.
  // Controller for the second number input field
  final TextEditingController _secondNumberController = TextEditingController();

  // Variable to store the result of the calculation
  String _result = '';

  // Method to perform calculations based on the operation
  void _calculate(String operation) {
    // Parse the first number from the input flied. the double.tryParse method is used to convert the string input from the text field into a double value. If the input cannot be parsed as a double, it returns null.
    final double? num1 = double.tryParse(_firstNumberController.text);
    // Parse the second number from the input field
    final double? num2 = double.tryParse(_secondNumberController.text);

    // Check if the inputs are valid numbers
    //the set state method is used to update the state of the widget and trigger a rebuild of the UI. It takes a callback function that contains the code to update the state.
    if (num1 == null || num2 == null) {
      setState(() {
        _result = 'Invalid input'; // Set result to error message if inputs are invalid
      });
      return;
    }

    double result;
    // Perform the calculation based on the selected operation
    switch (operation) {
      case 'add':
        result = num1 + num2; // Addition
        break;
      case 'subtract':
        result = num1 - num2; // Subtraction
        break;
      case 'multiply':
        result = num1 * num2; // Multiplication
        break;
      case 'divide':
        if (num2 == 0) { // Check for division by zero
          setState(() {
            _result = 'Cannot divide by zero'; // Set result to error message if division by zero
          });
          return;
        }
        result = num1 / num2; // Division
        break;
      default:
        result = 0; // Default case (should not occur)
    }

    // Update the result state to display the calculation result
    setState(() {
      _result = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) { // THIS IS THE BUILD METHOD THAT BUILDS THE UI
    // The build method returns a Scaffold widget that provides the basic structure of the app. the buildcontext parameter is the BuildContext object that represents the location of this widget in the widget tree. It is used to access the theme, media query, and other properties of the app.

    //scaffold is a widget that provides a basic structure for the app, including an app bar, body, and floating action button. It is a common pattern in Flutter apps.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 57, 105, 196),
        title: Text(
          widget.title,
          style: const TextStyle(color: Color.fromARGB(255, 247, 245, 245)),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 45.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Welcome to the Simple Calculator',
                  style: TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 57, 105, 196),
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 57, 105, 196),
                  ),
                  textAlign: TextAlign.center,
                ), 
                SizedBox(height: 30),


                // TextField for entering the first number
                TextField(
                  controller: _firstNumberController, // Attach controller to manage input. it is used to control the text being edited in a TextField widget. It allows you to read the current value of the text field, set a new value, and listen for changes to the text field's value.
                  decoration: InputDecoration(
                    labelText: 'Enter the first number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  keyboardType: TextInputType.number, // Set input type to number
                ),
                SizedBox(height: 20),
                // TextField for entering the second number


                TextField(
                  controller: _secondNumberController, // Attach controller to manage input
                  decoration: InputDecoration(
                    labelText: 'Enter the second number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  keyboardType: TextInputType.number, // Set input type to number
                ),
                SizedBox(height: 35),

                // Text widget to prompt user to choose an operation
                const Text(
                  'Choose an operation',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 57, 105, 196),
                  ),
                ),
                SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Button for addition operation
                    ElevatedButton(
                      onPressed: () => _calculate('add'), // Call calculate method with 'add'. the _calculate method is called when the button is pressed, passing the operation as an argument.
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 57, 105, 196),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),


                    // Button for subtraction operation
                    ElevatedButton(
                      onPressed: () => _calculate('subtract'), // Call calculate method with 'subtract'
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 57, 105, 196),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Icon(Icons.remove, color: Colors.white),
                    ),


                    // Button for multiplication operation
                    ElevatedButton(
                      onPressed: () => _calculate('multiply'), // Call calculate method with 'multiply'
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 57, 105, 196),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Icon(Icons.clear, color: Colors.white),
                    ),


                    // Button for division operation
                    ElevatedButton(
                      onPressed: () => _calculate('divide'), // Call calculate method with 'divide'
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 57, 105, 196),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Icon(Icons.percent, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 45),


                Row(
                  children: [
                    const Text(
                      'The Result is:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 57, 105, 196),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      // TextField to display the result
                      child: TextField(
                        controller: TextEditingController(text: _result), // Display the result
                        readOnly: true, // Make the field read-only
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),

                // Buttons to navigate to other screens
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SecondScreen()),
                        );
                      },
                      icon: const Icon(Icons.calculate_outlined, color: Colors.white),
                      label: const Text(
                        'Sci-Calculator',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 57, 105, 196),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NotesScreen()),
                        );
                      },
                      icon: const Icon(Icons.note_alt_outlined, color: Colors.white),
                      label: const Text(
                        'Notes',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 57, 105, 196),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
