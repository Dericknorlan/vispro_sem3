import 'animalSound.dart';


void main() {
  Animal myDog = Dog();
  Animal myCat = Cat();

  // Calling methods on Dog
  print('Dog:');
  myDog.sound();
  myDog.eat();

  // Calling methods on Cat
  print('Cat:');
  myCat.sound();
  myCat.eat();
}
