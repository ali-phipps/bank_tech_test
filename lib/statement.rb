class Statement
  def self.print(transactions)
    balance = 0
    lines = "date || credit || debit || balance\n"

    transactions.history.each do |transaction|
      line = transaction.date + ' || '
      if transaction.type == 'credit'
        balance += transaction.amount
        line += transaction.amount.to_s + ' || || ' + balance.to_s + '\n'
      else
        balance -= transaction.amount
        line += '|| ' + transaction.amount.to_s + ' || ' + balance.to_s + '\n'
      end

      lines += line
    end
    lines
  end
end
