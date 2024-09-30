class Student {
  String name;
  int studentId;
  double grade;

  Student(this.name, this.studentId, this.grade);

  // method to display Student Information
  void displayStudentInfo() {
    print("Name: $name");
    print("Student Id: $studentId");
    print("Grade: $grade");
  }
  
  // method to check if student pass or not
  bool checkIfPasses() {
    return grade >= 70;
  }
}

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
