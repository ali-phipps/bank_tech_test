require 'account'

describe Account do

  before(:each) do
    @account = Account.new(name: "Alistair Phipps")
  end

  describe "initialise account" do
    it "new account is created for a customer and has an opening balance of zero" do
      expect(@account.balance).to eq 0
    end

    it "new account is created for a customer and has user specified balance" do
      @account_with_balance = Account.new(name: "Alistair Phipps", balance: 1000)
      expect(@account_with_balance.balance).to eq 1000
    end
  end
end
