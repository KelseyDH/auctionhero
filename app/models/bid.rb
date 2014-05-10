class Bid < ActiveRecord::Base
  belongs_to :auction
  # before_validation :current_price


  validates :amount, presence: true, numericality: true



  scope :ordered_by_amount, -> {order("amount DESC")}

  #must validate that bid price must be higher than current price


  # def initialize()
  # end

  # def is_valid_bid?
  #   @auction = Auction.find(params[:auction_id])

  #   if (self + 1) > @auction.current_price
  #     return true
  #   else
  #     return false
  #   end
  # end
  # private

  # def current_price
  #   @auction = Auction.find_by_id(self.auction_id)
  #   self.auction.bids.ordered_by_amount.first.amount + 1
  # end

  # def self.highest_bid
  #   self.auction.bids.ordered_by_amount.first.amount
  # end




  # def is_above_reserve_price
  #   if bid.amount <= auction.reserve_price
  #     errors.add(:amount, "Bid amount must be higher than current bid")
  #   end
  # end



  # def minimum_bid_price
    
  #   auction.bids.ordered_by_amount.first    
  # end 

end
