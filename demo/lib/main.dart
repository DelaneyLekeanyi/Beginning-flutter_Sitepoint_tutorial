import 'package:flutter/material.dart';

//WHERE THE APP STARTS EXECUTING THE VOID MAIN FUNCTION.

//ways to call the main function


/*way 1 arrow syntax
void main() => runApp(const MyApp());*/

// way 2 function body syntax
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //removing the debug banner.
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 251, 252, 251)),

      ),
      home: const MyHomePage(title: 'My Application'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Changed AppBar background to white
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black), // Changed title text color to black
        ),
        iconTheme: const IconThemeData(color: Colors.black), // Changed AppBar icon color to black
      ),
      body: Container(
        // Adding an image as background
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'this is a simple counter app',
                style: TextStyle(color: Colors.white), // Text color set to white
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white, // Text color set to white
                      fontSize: 40,
                    ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Equal spacing between buttons
        children: [
          // Decrement Button
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            backgroundColor: Colors.white, // Changed button background to white
            child: const Icon(Icons.remove, color: Colors.black), // Decrement icon
          ),

          // Reset Button
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _counter = 0; // Reset counter to zero
              });
            },
            tooltip: 'Reset Counter',
            backgroundColor: Colors.white, // Changed button background to white
            child: const Icon(Icons.delete, color: Colors.black), // Trash icon
          ),

          // Increment Button
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            backgroundColor: Colors.white, // Changed button background to white
            child: const Icon(Icons.add, color: Colors.black), // Increment icon
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}