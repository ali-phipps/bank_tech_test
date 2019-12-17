require 'account'

describe Account do

  before(:all) do
    account = Account.new(name: "Alistair Phipps")
  end

  describe "initialise account" do
    it "new account is created for a customer and has an opening balance of zero" do

      expect(account.balance).to eq 0
    end
  end
end
