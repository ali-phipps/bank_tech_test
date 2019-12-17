require 'transaction_history'

describe TransactionHistory do
  let(:transaction_class) { double('transaction class', new: transaction) }
  let(:transaction) { double('transaction') }

  subject(:history) { TransactionHistory.new(transaction_class) }
  describe "add" do
    it "add a transaction to the history" do
      expect(history.add(5,'credit')).to eq transaction
    end

  end

end
