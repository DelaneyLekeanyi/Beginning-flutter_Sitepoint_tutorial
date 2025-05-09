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
      home: const MyHomePage(title: 'Registration Form'),
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addressController = TextEditingController(); 
  final TextEditingController _passwordController = TextEditingController();
  //the initState method is called when the state object is created. It is used to initialize any data or state that the widget needs before it is built.

  String name = '';
  String email = '';
  String phone = '';
  String dob = '';
  String address = '';
  String password = '';
  

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
        
        padding: const EdgeInsets.only(top:40.0),
        child: SingleChildScrollView(
          child : Padding(
            padding : const EdgeInsets.all(25.0),
            child: Column(
            //the 
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Name field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      //color: Color.fromARGB(255, 57, 105, 196),
                      //width: 2.0,
                    ),
                  ),
                  
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              //the sizedBox widget is used to create a fixed-size box with a specified height or width. It can be used to add space between widgets or to create a specific size for a widget.
              SizedBox(height: 20),

              //Email field
              TextField(
                
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      //color: Color.fromARGB(255, 57, 105, 196),
                      //width: 2.0,
                    ),
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 20),

              // Phone number field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      //color: Color.fromARGB(255, 57, 105, 196),
                      //width: 2.0,
                    ),
                  ),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              SizedBox(height: 20),

              //date of birth field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      //color: Color.fromARGB(255, 57, 105, 196),
                      //width: 2.0,
                    ),
                  ),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
              ),
               SizedBox(height: 20),


              //Address field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      //color: Color.fromARGB(255, 57, 105, 196),
                      //width: 2.0,
                    ),
                  ),
                  prefixIcon: Icon(Icons.home),
                ),
              ),
              SizedBox(height: 20),
            
              // Password field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      //color: Color.fromARGB(255, 57, 105, 196),
                      //width: 2.0,
                    ),
                  ),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 40),

              // submit button
              ElevatedButton(
                onPressed: () {
                  // Handle form submission
                  setState(() {
                    // Get the values from the text fields
                    String name = _nameController.text;
                    String email = _emailController.text;
                    String phone = _phoneController.text;
                    String dob = _dobController.text;
                    String address = _addressController.text;
                    String password = _passwordController.text;

                    // Clear the text fields after submission
                    _nameController.clear();
                    _emailController.clear();
                    _phoneController.clear();
                    _dobController.clear();
                    _addressController.clear();
                    _passwordController.clear();
                  });

                  // Perform your form submission logic here
                  print('Name: $name');
                  print('Email: $email'); 
                  print('Phone: $phone');
                  print('Date of Birth: $dob');
                  print('Address: $address');
                  print('Password: $password');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0), // Rounded corners for the button
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                  backgroundColor: const Color.fromARGB(255, 57, 105, 196), // Button color
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 18, color: Colors.white), // Text style
                ),
              ),
              
              
            ],
          ),
          )
        ),
      ),
    );
  }
}