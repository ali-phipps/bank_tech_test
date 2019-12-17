class Account
  attr_reader :balance

  def initialize(name:, balance: 0)
    @balance = balance
    @customer_name = name
    @transaction_history = []
  end
end
