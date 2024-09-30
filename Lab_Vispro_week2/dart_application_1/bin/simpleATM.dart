class atm {
  double _balance = 0;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposited: $amount');
    } else {
      print('Invalid deposit amount');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print('Withdraw: \$$amount');
    } else {
      print('Insufficient balance or invalid amount');
    }
  }

  double checkBalance() {
    return _balance;
  }
}

void main() {
  atm ATM = atm();

  ATM.deposit(1500);
  print('Current Balance: ${ATM.checkBalance()}');

  ATM.withdraw(100);
  print('Current Balance: ${ATM.checkBalance()}');

  ATM.withdraw(2000);
  print('Current Balance: ${ATM.checkBalance()}');
}