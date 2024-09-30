// main.dart
import 'dart:io';
import 'bankSystem.dart';

void main() {
  SavingsAccount savings = SavingsAccount(
      100000, 1); // Initial balance of 100,000 and interest rate of 1%

  while (true) {
    print('\nCurrent Balance: \Rp.${savings.checkBalance()}');
    print('Choose an option:');
    print('1. Deposit');
    print('2. Withdraw');
    print('3. Apply Interest');
    print('4. Exit');
    stdout.write('Enter your choice: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter amount to deposit: ');
        double? depositAmount = double.tryParse(stdin.readLineSync()!);
        if (depositAmount != null) {
          savings.deposit(depositAmount);
        } else {
          print('Invalid amount entered for deposit.');
        }
        break;
      case '2':
        stdout.write('Enter amount to withdraw: ');
        double? withdrawAmount = double.tryParse(stdin.readLineSync()!);
        if (withdrawAmount != null) {
          savings.withdraw(withdrawAmount);
        } else {
          print('Invalid amount entered for withdrawal.');
        }
        break;
      case '3':
        savings.applyInterest();
        break;
      case '4':
        print('Exiting...');
        return; // Exit the program
      default:
        print('Invalid choice. Please try again.');
    }
  }
}
