require 'account'
require 'timecop'

describe Account do
  subject(:account_with_balance) { Account.new(name: 'Alistair Phipps',
                                               balance: 1000) }

  before(:each) do
    Timecop.freeze(Time.local(2019, 12, 17))
  end

  describe '#initialise account' do
    it 'new account is created for a customer and
    has an opening balance of zero' do
      account = Account.new(name: 'Alistair Phipps')
      expect(account.balance).to eq 0
    end

    it 'new account is created for a customer and has user specified balance' do
      expect(account_with_balance.balance).to eq 1000
    end
  end

  describe '#deposit' do
    it 'make a single deposit' do
      transaction = account_with_balance.deposit(1000)
      expect(transaction.type).to eq "credit"
      expect(transaction.amount).to eq 1000
      expect(transaction.date).to eq "17/12/2019"
    end
  end

  describe '#deposit' do
    it 'make a single deposit' do
      transaction = account_with_balance.deposit(1000)
      expect(transaction.type).to eq "credit"
      expect(transaction.amount).to eq 1000
      expect(transaction.date).to eq "17/12/2019"
    end
  end

  describe '#withdrawal' do
    it 'make a single deposit' do
      transaction = account_with_balance.withdrawl(1000)
      expect(transaction.type).to eq "debit"
      expect(transaction.amount).to eq 1000
      expect(transaction.date).to eq "17/12/2019"
    end
  end
end
