// this is a single line commenet.
/*
this is a multi-line comment.


//creating a variable
var name = "John Doe";  //string variable
int age = 30; //integer variable
double height = 5.9; //double variable
bool isStudent = false; //boolean variable



void main() {
  print('hello $name you are $age yrs old and tour height is $height and tou are a student $isStudent');


//printing th variable types.

print('variable name is a ${name.runtimeType} '); // String
print('variable age is a ${age.runtimeType} '); // int
print('variable height is a ${height.runtimeType} '); // double
print('variable isStudent is a ${isStudent.runtimeType} '); // boolean.

}*/





//creating a list of strings.
void main(){
  List<dynamic> Info = ['john deo', 30, 5.9, false];
  List<String> credentials = ['john', 'age', 'height', 'School'];
  print(Info);


/*list splicing
  print(Info[0]); // john deo
  print(Info[1]); // 30
  print(Info[2]); // 5.9
  print(Info[3]); // false*/

  //printing every member if the list
  for (int i = 0; i < credentials.length; i++) {
    for(int i = 0; i<Info.length;i++){
      print('${credentials[i]} : ${Info[i]}');
    }
  }
}