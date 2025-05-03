# Beginning-flutter_Sitepoint_tutorial


#LLESSON 1 =====> LEARINNIG DARTS RPOGRAMING LANGUAGE

1) COMMENTS
2) VARIABLES
3) DATA TYPES
4) OPERATORS
5) CONDITIONALS
6) LOOPS
7) FUNCTIONS
8) CLASSES AND OBJECTS
9) EXCEPTION HANDLING
10) LIBRARIES
11) ASYNC PROGRAMMING



1.0 ====> COMMENTS.
        //single line comment
        /*multi-line comments*/.

 2.0 ===> variables
        - variables store refernces to value.
        -variable declaration with out innitailization it value equals null.
        -variables can be declared using var keyword or type name.
        -var is a dynamic variable that can hold any data type.
        -final and const are used for declaring constants.

        //Declared without specifying the type - Infers type
        var filter = 'company';

        // Declared by type
        String filter = 'company';

        // Uninitialized variable has an initial value of null
        String filter;

        // Value will not change
        final filter = 'company';

        // or
        final String filter = 'company';

        // or 
        const String filter = 'company'; 

        // or
        const String filter = 'company' + filterOption;

        // Public variable (variable name starts without underscore)
        String userName = 'Sandy';

        // Private variable (variable name starts with underscore)
        String _userID = 'XW904';
3.0 ====> Data types
        -Dart supports primitive data types like int, double, bool and string.
        -Dart also support collection data types like list and map.
        -int: represents whole numbers from -infinity to infinity.
        -double:represents floating point number.
        -bool: represents true or false values.
        -string: represents text data enclosed in single quotes('') or double quotes("")

        #examples.
        -first 3 exxamples are known as numbers.
        -last example is known as string.

    
        int age = 20;
        double height = 1.7;
        bool isMarried = false;
        String name = "John Doe";

        -Booleans
            decalringa variable as bool means the value is either true or false.
            #for example
            
            // Booleans
                bool isDone = false;
                isDone = true;

        -lists
            lists are collections of objects.
            accesing uses zero based index. whore every element ina list has its own index starting at 0.
            #for example
            List<String> names = ['John', 'Jane'];
            print(names[0]); // John
            print(names.length); // 2
    
            #example
            // List Growable
            List contacts = List();

            // or
            List contacts = [];
            List contacts = ['Linda', 'John', 'Mary'];

            // List fixed-length
            List contact = List(25);

            // Lists - In Dart List is an array
            List listOfFilters = ['company', 'city', 'state'];
            listOfFilters.forEach((filter) {
            print('filter: $filter');
            });
            // Result from print statement
            // filter: company
            // filter: city
            // filter: state
        -