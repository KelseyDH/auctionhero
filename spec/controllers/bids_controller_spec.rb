require "spec_helper"


describe BidsController do
  let(:auction) { create(:auction, title: "some title", 
                         body: "some body text", 
                         reserve_price: 500) }
  let(:bid) { create(:bid, auction: auction)}
  let(:bid1) { create(:bid, auction: auction)}
  
  describe "#create" do

    context "with valid bid" do
      def valid_bid
        post :create, auction_id: auction.id, bid: {bid:10000 }
      end

      it "creates a bid for the auction" do
        expect do
         post :create, auction_id: auction.id, bid: {bid: 50000 } 
       end.to change { auction.bids.count }.by(1)
      end

      it "redirects to auction page with valid request" do
        valid_bid
        expect(response).to redirect_to(auction_path(auction.id))
      end

      it "sets a flash message" do
        valid_bid
        expect(flash[:notice]).to be
      end

    end

    context "with invalid bid" do
      def invalid_bid
        post :create, auction_id: auction.id, bid: {bid: nil }
      end

      it "doesn't create a bid in the database" do
        expect { invalid_bid }.to_not change { Bid.count }
      end
    end



      # it "renders failure status message" do
      #   invalid_bid
      #   parsed_body = JSON.parse(response.body)
      #   expect(parsed_body["status"]).to eq("failure")
      # end

      # it "sends error message" do
      #   invalid_bid
      #   parsed_body = JSON.parse(response.body)
      #   expect(parsed_body["errors"]).to be
      # end

  end



end