require "spec_helper"


describe Bid do
  describe "#amount" do


    it "checks for amount" do
      bid = Bid.new(amount: nil)
      bid.save
      expect(bid).to_not be_valid
    end
  end


end