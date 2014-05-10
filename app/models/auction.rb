class Auction < ActiveRecord::Base


  # validates :is_highest_bid

  has_many :bids, dependent: :destroy

  validates :title, presence: true
  validates :reserve_price, presence: true

  def current_price

      self.bids.ordered_by_amount.first.amount 
  end

  # def is_highest_bid    
  # errors.add(:base, "bid too low") if self.bids.ordered_by_amount.first.amount
  # end


end
