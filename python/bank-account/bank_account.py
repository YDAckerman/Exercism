import threading
import operator

class BankAccount:
    def __init__(self):
        self.lock = threading.Lock()
        self.status = False

    def get_balance(self):
        if self.status :
            return self.balance
        else:
            raise ValueError("account is closed")
        
    def open(self):
        if not self.status:
            self.status = True
            self.balance = 0
        else:
            raise ValueError("account already open")

    def deposit(self, amount):
        if self.status and amount > 0:
            self.__lock_transact(operator.add, amount)
        else:
            raise ValueError("deposit denied")

    def withdraw(self, amount):
        if self.status and amount <= self.balance and amount > 0:
            self.__lock_transact(operator.sub, amount)
        else:
            raise ValueError("withdrawl denied")

    def close(self):
        if self.status:
            self.status = False
        else:
            raise ValueError("account is closed")

    def __lock_transact(self, f, amount):
        self.lock.acquire()
        try:
            self.balance = f(self.balance, amount)
        finally:
            self.lock.release()
