import 'dart:math';
import 'sci-cal.dart';

import 'package:flutter/material.dart';
/*the material.dart library is a part of the flutter framework that provides a set of widgets and tools for building beautiful and responsive user interfaces using the Material Design guidelines.
it includes widgets for layout, navigation, input, and more, allowing developers to create visually appealing and user-friendly applications for both Android and iOS platforms.
//WHERE THE APP STARTS EXECUTING THE VOID MAIN FUNCTION.
*/

//ways to call the main function


/*way 1 arrow syntax
void main() => runApp(const MyApp());*/

// way 2 function body syntax
//the main function is the entry point of the application, and it calls the runApp function to start the app.
//the runApp function takes a widget as an argument and makes it the root of the widget tree, which is the starting point for building the user interface.

// a widget is a basic building block of a Flutter app's user interface. It describes the configuration of an element in the UI, such as a button, text, or layout structure.
void main() {
  runApp(const MyApp());
}

//the MyApp class is a stateless widget that represents the root of the application. It builds the MaterialApp widget, which is the main app widget that provides various features like theming, routing, and navigation.
//the MaterialApp widget is a convenience widget that wraps several widgets that are commonly required for material design applications. It includes the app's title, theme, and home page.


class MyApp extends StatelessWidget {

  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //removing the debug banner.
      debugShowCheckedModeBanner: false,
  
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 54, 104, 219)),

      ),
      home: const MyHomePage(title: 'Simple Calculator'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // The title is passed to the widget and will be displayed in the app bar.
  // The title is a required parameter of type String.
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //controllers for the text fields
  //the TextEditingController class is used to control the text being edited in a text field. It allows you to read and modify the text in the field.
  
  //the initState method is called when the state object is created. It is used to initialize any data or state that the widget needs before it is built.

  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 57, 105, 196),
        title: Text(
          widget.title,
          style: const TextStyle(color: Color.fromARGB(255, 247, 245, 245)),
        ),
        centerTitle: true,
      ),

      // Background color
      backgroundColor: Colors.white,
      body: Padding(
        
        padding: const EdgeInsets.only(top:45.0),
        child: SingleChildScrollView(
          child : Padding(
            padding : const EdgeInsets.all(25.0),
            child: Column(
            //the 
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              //text widget is used to display a string of text in the UI. It can be styled with different fonts, colors, and sizes.
              const Text(
                'Welcome to the Simple Calculator',
                style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                  decorationColor: Color.fromARGB(255, 57, 105, 196),
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 57, 105, 196),
                ),
                 //center the text in the center of the screen
                textAlign: TextAlign.center,
                
              ),
               SizedBox(height: 30),
              // Name field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter the first number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      //color: Color.fromARGB(255, 57, 105, 196),
                      //width: 2.0,
                    ),
                  ),
                  
                ),
              ),
              //the sizedBox widget is used to create a fixed-size box with a specified height or width. It can be used to add space between widgets or to create a specific size for a widget.
              SizedBox(height: 20),

              //Email field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter the second number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      //color: Color.fromARGB(255, 57, 105, 196),
                      //width: 2.0,
                    ),
                  ),
                 
                ),
              ),
              SizedBox(height: 35),

              //text widget is used to display a string of text in the UI. It can be styled with different fonts, colors, and sizes.
              const Text(
                      'Choose an operation',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 57, 105, 196),
                        
                      ),
                    ),
                     SizedBox(height: 15),
                              //4 button that will perform the operations.
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    ElevatedButton(
                      onPressed: () {
                        // Addition logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 57, 105, 196),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Subtraction logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 57, 105, 196),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Icon(Icons.remove, color: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Multiplication logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 57, 105, 196),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Icon(Icons.clear, color: Colors.white), // 'clear' is a multiplication symbol
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Division logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 57, 105, 196),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Icon(Icons.percent, color: Colors.white), // or use Icons.horizontal_rule for division
                    ),
                  ],
                ),
              SizedBox(height: 45),

                 Row(
                  children: [
                    const Text('The Result is:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 57, 105, 196))),
                    
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
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
              

              SizedBox(height: 40), // Add some space before the navigation buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle previous action
                    },
                    //icon: const Icon(Icons.arrow_back, color: Colors.white),
                    label: const Text('Cal-Form'
                      , style: TextStyle(color: Colors.white),
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
                        MaterialPageRoute(builder: (context) => const SecondScreen()),
                      );
                    },
                    icon: const Icon(Icons.calculate, color: Colors.white),
                    label: const Text('Sci-Calculator',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(91, 57, 106, 196),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          )
        ),
      ),
    );
  }
}