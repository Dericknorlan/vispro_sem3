import 'dart:io';

void main() {
  stdout.write('Enter temperature in Celsius: ');
  double celsius = double.parse(stdin.readLineSync()!);

  print('1. Reaumur');
  print('2. Fahrenheit');
  print('3. Kelvin');
  stdout.write('Choose a conversion: ');
  
  int choice = int.parse(stdin.readLineSync()!);
  switch (choice) {
    case 1:
      double reaumur = celsius * 0.8;
      print('$celsius °C is equal to $reaumur °Re');
      break;
    case 2:
      double fahrenheit = (celsius * 9/5) + 32;
      print('$celsius °C is equal to $fahrenheit °F');
      break;
    case 3:
      double kelvin = celsius + 273.15;
      print('$celsius °C is equal to $kelvin K');
      break;
    default:
      print('Invalid choice. Please select 1, 2, or 3.');
      break;
  }
}
