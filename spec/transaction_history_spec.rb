require 'transaction_history'

describe TransactionHistory do
  let(:transaction_class) { double('transaction class', new: transaction) }
  let(:transaction) { double('transaction') }

  subject(:history) { TransactionHistory.new(transaction_class) }
  describe '#add' do
    it 'add a transaction to the history' do
      expect(history.add(amount: 1000, type: 'credit')).to eq transaction
    end
  end

  describe '#transaction' do
    it 'history returned' do
      history.add(amount: 1000, type: 'credit')
      expect(history.history).to include(transaction)
    end
  end
end
