require 'transaction'

class Account
  attr_reader :balance

  def initialize(name:, balance: 0, history: TransactionHistory.new)
    @balance = balance
    @customer_name = name
    @transaction_history = history
  end

  def deposit(value)
    transaction
    transaction = Transaction.new(amount: value, type: 'credit')
    @transaction_history << transaction
    transaction
  end
end
