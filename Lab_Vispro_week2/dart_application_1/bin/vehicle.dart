import 'dart:io';

class Vehicle {
  String name;
  double speed;

  Vehicle(this.name, this.speed);

  // Method to describe how the vehicle moves
  void move() {
    String speedDescription = describeSpeed(speed);
    print('$name $speedDescription at $speed km/h.');
  }

  // Function to describe speed category
  String describeSpeed(double speed) {
    if (speed > 60) {
      return 'moves fast';
    } else if (speed < 30) {
      return 'moves slow';
    } else {
      return 'moves at a normal speed';
    }
  }
}

class Car extends Vehicle {
  Car(String name, double speed) : super(name, speed);

  @override
  void move() {
    String speedDescription = describeSpeed(speed);
    print('$name $speedDescription on roads at $speed km/h.');
  }
}

class Bike extends Vehicle {
  Bike(String name, double speed) : super(name, speed);

  @override
  void move() {
    String speedDescription = describeSpeed(speed);
    print('$name $speedDescription through traffic at $speed km/h.');
  }
}

void main() {
  // Ask user for input
  stdout.write('Do you want to create a Car or a Bike? (Enter "Car" or "Bike"): ');
  String choice = stdin.readLineSync()!.trim().toLowerCase();

  stdout.write('Enter the name of the vehicle: ');
  String name = stdin.readLineSync()!;

  stdout.write('Enter the speed of the vehicle (in km/h): ');
  double speed = double.parse(stdin.readLineSync()!);

  Vehicle vehicle;

  // Create the appropriate vehicle based on user choice
  if (choice == 'car') {
    vehicle = Car(name, speed);
  } else if (choice == 'bike') {
    vehicle = Bike(name, speed);
  } else {
    print('Invalid choice. Please enter "Car" or "Bike".');
    return; // Exit the program if the choice is invalid
  }

  // Call the move() method
  vehicle.move();
}
