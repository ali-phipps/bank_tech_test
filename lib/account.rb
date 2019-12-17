require 'transaction'

class Account
  attr_reader :balance

  def initialize(name:, balance: 0)
    @balance = balance
    @customer_name = name
    @transaction_history = []
  end

  def deposit(value)
    transaction = Transaction.new(amount: value, type: 'credit')
    @transaction_history << transaction
    transaction
  end
end
