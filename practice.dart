// this is a single line commenet.
/*
this is a multi-line comment.
*/

//creating a variable
var name = "John Doe";  //string variable
int age = 30; //integer variable
double height = 5.9; //double variable
bool isStudent = false; //boolean variable



void main() {
  print('hello $name you are $age yrs old and tour height is $height and tou are a student $isStudent');


//printing th variable types.

print('variable name is a ${name.runtimeType} '); // String
print('variable age is an ${age.runtimeType} '); // int
print('variable height is a ${height.runtimeType} '); // double
print('variable isStudent is a ${isStudent.runtimeType} '); // boolean.

}