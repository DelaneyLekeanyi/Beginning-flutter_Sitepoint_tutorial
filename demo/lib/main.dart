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

  // This widget is the root of your application.
  //@override is an annotation that indicates that the method is overriding a method from a superclass.Because MyApp extends StatelessWidget, it overrides the build method of the StatelessWidget class.
  //the build method is called when the widget is inserted into the widget tree, and it is responsible for creating the widget tree that represents the user interface of the application.
  //the build method is responsible for creating the widget tree that represents the user interface of the application.
  //the build method returns a widget tree that consists of multiple nested widgets.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //removing the debug banner.
      debugShowCheckedModeBanner: false,
      //the theme property is used to define the overall look and feel of the application. It allows you to customize various aspects of the app's appearance, such as colors, fonts, and styles.
      //the colorScheme property is used to define a set of colors that can be used throughout the app. The seedColor parameter is used to generate a color scheme based on the specified color.
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 78, 154, 195)),

      ),
      home: const MyHomePage(title: 'My Application'),
    );
  }
}
/*here we are creating a stateful widget called MyHomePage. A stateful widget is a widget that can change its state during its lifetime. It has two classes: MyHomePage and _MyHomePageState.
the MyHomePage class is the main widget that will be displayed on the screen. It takes a title as a parameter and passes it to the _MyHomePageState class.*/

//the _MyHomePageState class is where the state of the widget is managed. It contains a counter variable and methods to increment and decrement the counter. The build method is responsible for creating the UI of the widget.
//the MyHomePage class is a stateful widget that represents the main screen of the application. It takes a title as a parameter and creates an instance of the _MyHomePageState class to manage its state.

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // The title is passed to the widget and will be displayed in the app bar.
  // The title is a required parameter of type String.
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
    //scaffold is a widget that provides a basic structure for the app's UI. It includes an app bar, body, and floating action button.
    
    return Scaffold(
      //the AppBar widget is a material design app bar that displays the title of the app and provides a place for actions such as buttons and menus.
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255), // AppBar background remains white
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black), // Title text color set to black
        ),
        iconTheme: const IconThemeData(color: Colors.black), // AppBar icon color set to black
      ),
      backgroundColor: Colors.transparent, // Make the Scaffold background transparent
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

        //the child property is used to define the content of the Scaffold's body.
        //the Container widget is used to create a rectangular visual element that can contain other widgets.
        child: Container(
          // Adding a semi-transparent black overlay
          color: Colors.black.withOpacity(0.5), // Adjust the opacity as needed
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
      ),
      //the floatingActionButton property is used to define a button that floats above the content of the Scaffold.
      //the FloatingActionButton widget is a circular button that is typically used for primary actions in the app.
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Equal spacing between buttons
        children: [
          // Decrement Button
          FloatingActionButton(
            //the onPressed property is used to define the action that will be performed when the button is pressed.
            //the tooltip property is used to provide a short description of the button's action, which is displayed when the user long-presses the button.
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            backgroundColor: const Color.fromRGBO(64, 111, 197, 1), // Button background set to white
            child: const Icon(Icons.remove, color: Color.fromARGB(255, 247, 247, 247)), // Decrement icon
          ),
  
          // Reset Button
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _counter = 0; // Reset counter to zero
              });
            },
            tooltip: 'Reset Counter',
            backgroundColor: const Color.fromRGBO(64, 111, 197, 1), // Button background set to white
            child: const Icon(Icons.delete, color: Color.fromARGB(255, 247, 247, 247)), // Trash icon
          ),
  
          // Increment Button
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
           backgroundColor: const Color.fromRGBO(64, 111, 197, 1),// Button background set to white
            child: const Icon(Icons.add, color: Color.fromARGB(255, 254, 254, 254)), // Increment icon
          ),
        ],
      ),
      //the floatingActionButtonLocation property is used to specify the location of the floating action button within the Scaffold.
      //the FloatingActionButtonLocation.centerFloat value positions the button at the center of the screen, floating above the content.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}