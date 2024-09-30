class bankAccount {
  double _balance;

  bankAccount(this._balance);

  void deposit(double amount) {
    _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
    } else {
      print('insufficient balance');
    }
  }

  double checkBalance() {
    return _balance;
  }
}

class savingsAccount extends bankAccount {
  double interestRate;

  savingsAccount(double balance, this.interestRate) : super(balance);

  void applyInterest() {
    deposit(checkBalance() * interestRate / 100);
  }
}

void main() {
  savingsAccount savings = savingsAccount(10000, 1);

  print('Initial Balance: ${savings.checkBalance()}');

  savings.deposit(500);
  print('Balance after Depposit: ${savings.checkBalance()}');

  savings.withdraw(1500);
  print('Balance after Withdaraw: ${savings.checkBalance()}');

  savings.applyInterest();
  print('Balance after Apply Interest: ${savings.checkBalance()}');
}
