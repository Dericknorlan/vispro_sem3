class BankAccount {
  double _balance;

  BankAccount(this._balance);

  double get balance => _balance;

  set balance(double newBalance) {
    if (newBalance >= 0) {
      _balance = newBalance;
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

class SavingsAccount extends BankAccount {
  double interestRate;

  SavingsAccount(double balance, this.interestRate) : super(balance);

  // Getter for interestRate
  double get interest => interestRate;

  // Setter for interestRate
  set interest(double newRate) {
    if (newRate >= 0) {
      interestRate = newRate;
    } else {
      print('Interest rate cannot be negative.');
    }
  }

  void applyInterest() {
    double interestAmount = checkBalance() * (interestRate / 100);
    if (interestAmount > 0) {
      deposit(interestAmount); // Adds the interest to the balance
      print('Interest applied: \Rp.$interestAmount');
    } else {
      print('No interest to apply.');
    }
  }
}
