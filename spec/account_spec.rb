require 'account'
require 'timecop'

describe Account do
  let(:transaction_history) { double('transaction_history') }
  subject(:account) { Account.new(history: transaction_history) }

  before(:each) do
    Timecop.freeze(Time.local(2019, 12, 17))
  end

  describe '#deposit' do
    it 'make a single deposit' do
      transaction_credit = double('transaction',
                                  type: 'credit',
                                  amount: 1000,
                                  date: '17/12/2019')
      allow(transaction_history).to receive(:add).and_return(transaction_credit)
      transaction = account.deposit(1000)
      expect(transaction.type).to eq 'credit'
      expect(transaction.amount).to eq 1000
      expect(transaction.date).to eq '17/12/2019'
    end
  end

  describe '#withdrawal' do
    it 'make a single withdraw' do
      transaction_debit = double('transaction',
                                 type: 'debit',
                                 amount: 1000,
                                 date: '17/12/2019')
      allow(transaction_history).to receive(:add).and_return(transaction_debit)
      transaction = account.withdraw(1000)
      expect(transaction.type).to eq 'debit'
      expect(transaction.amount).to eq 1000
      expect(transaction.date).to eq '17/12/2019'
    end
  end

  describe '#Generate_statement' do
    it 'prints a statement of transactions' do
      print_result =
        "date || credit || debit || balance\n17/12/2019 || 1000 || || 1000\n17/12/2019 || || 1000 || 0\n"
      allow(Statement).to receive(:print).and_return(print_result)
      expect(account.generate_statement).to eq print_result
    end
  end
end
