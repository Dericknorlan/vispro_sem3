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

