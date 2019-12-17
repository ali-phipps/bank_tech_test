
class Account

  attr_reader :balance

  def initialize(name:, balance: 0)
    @balance = balance
    @customerName = name
    @transactionHistory = {}
  end
end
