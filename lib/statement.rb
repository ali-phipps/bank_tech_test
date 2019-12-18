class Statement

  def self.print(transactions)
    balance = 0
    lines = "date || credit || debit || balance\n"

    transactions.history.each do |transaction|
      if transaction.type == "credit"
        balance += transaction.amount
        lines += transaction.date + " || " + transaction.amount.to_s +
                 ' || || ' + balance.to_s + "\n"
      else
        balance -= transaction.amount
        lines += transaction.date + " || " + '|| ' + transaction.amount.to_s +
                 ' || ' + balance.to_s + "\n"
      end
    end
    lines
  end

end
