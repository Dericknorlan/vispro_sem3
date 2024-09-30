class ATM {
  double _balance = 0;

  double get balance => _balance;

  set balance(double newBalance) {
    if (newBalance >= 0) {
      _balance = newBalance;
      print('Balance updated to: \Rp$newBalance');
    } else {
      print('Balance cannot be negative.');
    }
  }

  void deposit(double amount) {
    if (amount < 50000) {
      print('Minimum deposit amount is 50,000.');
    } else {
      _balance += amount;
      print('Deposited: \Rp$amount');
    }
  }

  void withdraw(double amount) {
    if (amount < 50000) {
      print('Minimum withdrawal amount is 50,000.');
    } else if (amount <= _balance) {
      _balance -= amount;
      print('Withdrew: \Rp$amount');
    } else {
      print('Insufficient balance');
    }
  }

  double checkBalance() {
    return _balance;
  }
}
