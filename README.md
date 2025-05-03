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
