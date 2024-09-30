import 'dart:io';
import 'vehicle.dart';
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