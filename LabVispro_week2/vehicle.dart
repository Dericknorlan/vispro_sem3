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