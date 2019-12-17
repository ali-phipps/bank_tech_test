require 'transaction'
require 'timecop'

describe Transaction do
  before(:each) do
    Timecop.freeze(Time.local(2019, 12, 17))
  end
  describe 'credit' do
    it "deposit with today's date" do
      transaction = Transaction.new(amount: 1000, type: 'credit')
      expect(transaction.date).to eq '17/12/2019'
      expect(transaction.amount).to eq 1000
      expect(transaction.type).to eq 'credit'
    end
  end

  describe 'debit' do
    it "withdraw with today's date" do
      transaction = Transaction.new(amount: 1000, type: 'debit')
      expect(transaction.date).to eq '17/12/2019'
      expect(transaction.amount).to eq 1000
      expect(transaction.type).to eq 'debit'
    end
  end
end
