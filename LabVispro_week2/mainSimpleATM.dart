import 'dart:io';
import 'simpleATM.dart';
void main() {
  ATM atm = ATM();
  
  while (true) {
    print('1. Deposit');
    print('2. Withdraw');
    print('3. Check Balance');
    print('4. Exit');
    stdout.write('Choose an option: ');
    
    String? choice = stdin.readLineSync();
    
    switch (choice) {
      case '1':
        stdout.write('Enter amount to deposit: ');
        double? amountToDeposit = double.tryParse(stdin.readLineSync() ?? '');
        if (amountToDeposit != null) {
          atm.deposit(amountToDeposit);
        } else {
          print('Invalid amount entered.');
        }
        break;
      case '2':
        stdout.write('Enter amount to withdraw: ');
        double? amountToWithdraw = double.tryParse(stdin.readLineSync() ?? '');
        if (amountToWithdraw != null) {
          atm.withdraw(amountToWithdraw);
        } else {
          print('Invalid amount entered.');
        }
        break;
      case '3':
        print('Current Balance: \Rp.${atm.checkBalance()}');
        break;
      case '4':
        print('Exiting...');
        return; // Exit the program
      default:
        print('Invalid choice. Please try again.');
    }
  }
}
