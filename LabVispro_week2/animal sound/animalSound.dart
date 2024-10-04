class Animal {
  void sound() {
    print('This animal makes a sound.');
  }

  // Method to eat
  void eat() {
    print('This animal is eating.');
  }
}

class Dog extends Animal {
  @override
  void sound() {
    print('Woof! Woof!');
  }

  @override
  void eat() {
    print('The dog is eating dog food.');
  }
}

class Cat extends Animal {
  @override
  void sound() {
    print('Meow! Meow!');
  }

  @override
  void eat() {
    print('The cat is eating cat food.');
  }
}