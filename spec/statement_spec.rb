require 'statement'

describe Statement do



  describe "#print" do

    before(:each) do
      @transaction_credit = double('transaction',
                                  type: 'credit',
                                  amount: 1000,
                                  date: '17/12/2019')
      @transaction_debit = double('transaction',
                                  type: 'debit',
                                  amount: 1000,
                                  date: '17/12/2019')
    end

    it "prints 1 credit" do
      transactions = double('transcation_history',
                              history: [@transaction_credit])
      expect(Statement.print(transactions)).to eq ("date || credit || debit || balance\n17/12/2019 || 1000 || || 1000\n")
    end

    it "prints 1 debit" do
      transactions = double('transcation_history',
                              history: [@transaction_debit])
      expect(Statement.print(transactions)).to eq ("date || credit || debit || balance\n17/12/2019 || || 1000 || -1000\n")
    end

    it "prints multiple credits" do
      transactions = double('transcation_history',
                              history: [@transaction_credit, @transaction_credit])
      expect(Statement.print(transactions)).to eq ("date || credit || debit || balance\n17/12/2019 || 1000 || || 1000\n17/12/2019 || 1000 || || 2000\n")
    end

    it "prints multiple debits" do
      transactions = double('transcation_history',
                              history: [@transaction_debit, @transaction_debit])
      expect(Statement.print(transactions)).to eq ("date || credit || debit || balance\n17/12/2019 || || 1000 || -1000\n17/12/2019 || || 1000 || -2000\n")
    end

    it "prints multiple debits and credits " do
      transactions = double('transcation_history',
                              history: [@transaction_credit, @transaction_credit,
                                        @transaction_debit, @transaction_debit])
      expect(Statement.print(transactions)).to eq ("date || credit || debit || balance\n17/12/2019 || 1000 || || 1000\n17/12/2019 || 1000 || || 2000\n17/12/2019 || || 1000 || 1000\n17/12/2019 || || 1000 || 0\n")
    end
  end
end
