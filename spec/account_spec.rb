require 'account'
require 'timecop'

describe Account do
  subject(:account) { Account.new }

  before(:each) do
    Timecop.freeze(Time.local(2019, 12, 17))
  end

  describe '#deposit' do
    it 'make a single deposit' do
      transaction = account.deposit(1000)
      expect(transaction.type).to eq 'credit'
      expect(transaction.amount).to eq 1000
      expect(transaction.date).to eq '17/12/2019'
    end
  end

  describe '#deposit' do
    it 'make a single deposit' do
      transaction = account.deposit(1000)
      expect(transaction.type).to eq 'credit'
      expect(transaction.amount).to eq 1000
      expect(transaction.date).to eq '17/12/2019'
    end
  end

  describe '#withdrawal' do
    it 'make a single deposit' do
      transaction = account.withdrawl(1000)
      expect(transaction.type).to eq 'debit'
      expect(transaction.amount).to eq 1000
      expect(transaction.date).to eq '17/12/2019'
    end
  end

  describe '#Generate_statement' do
    it 'prints a statement of transactions' do
      print_result =
      "date || credit || debit || balance\n17/12/2019 || 1000 || || 1000\n17/12/2019 || || 1000 || 0\n"
      account.deposit(1000)
      account.withdrawl(1000)
      expect(account.generate_statement).to eq print_result
    end
  end
end
