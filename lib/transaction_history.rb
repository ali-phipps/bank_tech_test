class TransactionHistory
  attr_reader :history
  def initialize(transaction_class = Transaction)
    @history = []
    @transaction = transaction_class
  end

  def add(type:, amount:)
    trans = @transaction.new(type: type, amount: amount)
    @history << trans
    trans
  end

end
