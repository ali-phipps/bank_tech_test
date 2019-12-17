class Transaction
  attr_reader :type, :amount

  def initialize(type:, amount:)
    @type = type
    @amount = amount
    @date = Time.now
  end

  def date
   @date.strftime('%d/%m/%Y')
  end
end
