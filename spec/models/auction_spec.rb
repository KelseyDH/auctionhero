require 'spec_helper'

describe Auction do

  it "doesn't allow creating an auction without params" do
    auction = Auction.new
    auction.save
    expect(auction).to_not be_valid
  end
  


end
