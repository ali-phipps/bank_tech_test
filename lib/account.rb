require_relative './statement.rb'
require_relative './transaction_history.rb'

class Account
  attr_reader :balance

  def initialize(history: TransactionHistory.new)
    @transaction_history = history
  end

  def deposit(value)
    @transaction_history.add(amount: value, type: 'credit')
  end

  def withdraw(value)
    @transaction_history.add(amount: value, type: 'debit')
  end

  def generate_statement
    Statement.print(@transaction_history)
  end
end
