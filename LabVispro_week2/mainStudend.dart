import 'studentClass.dart';

void main() {
  // create new student object
  Student student1 = Student("derick", 0806022310005, 90.10);

  //display object information
  student1.displayStudentInfo();

  // check if student pass or not
  if (student1.checkIfPasses()) {
    print("Status: Passed");
  } else {
    print("Status: Failed");
  }
}
