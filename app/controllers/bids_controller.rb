class BidsController < ApplicationController
  before_action :find_auction


  def create
    @bid = @auction.bids.new(bid_params)

    respond_to do |format| 
      if check_price && @bid.save
        format.html {redirect_to @auction, notice: "Bid created successfully!!" }
        format.js { render }
      else
        format.js { render :error}
        format.html {redirect_to @auction, notice: "The minimum bid must be higher than $#{@auction.reserve_price}" } 
      end
    end
    # if (@bid.amount.nil? || @bid.amount.blank?)
    #   redirect_to auction_path(@auction), notice: "Bid can't be blank!"

    #   elsif ((@bid.amount - 1 ) <= @bid.auction.current_price.to_f)
    #      redirect_to auction_path(@auction), notice: "Bid too low!"
    #   elsif @bid.save
    #     #render json: {status: "success", 
    #                   #amount: @bid.amount,
    #                   #url: auction_bid_path(@auction, @bid)}
    #     redirect_to auction_path(@auction), notice: "bid saved successfully!"
    #   else
    #     #render json: {status: "failure", errors: @bid.errors.full_messages}
    #     redirect_to auction_path(@auction), notice: "Bid was not submitted!"
    # end

  end

  def update
    @bid = bid.find(params[:id])
    if @bid.update_attributes(bid_params)
      render json: {status: "success"}
    else
      render json: {status: "failure"}
    end
  end

  private

  def bid_params
    params.require(:bid).permit([:amount])
  end

  def find_auction
    @auction = Auction.find(params[:auction_id])
  end

  # def create_bid
  #   if @auction.bids.count > 1
  #     @filler_bid = Bid.new(amount: 1)
  #     @filler_bid.save
  #     if self.bids.count == 0
  #     self.bids.new(amount: 1)
  #     end
  #   else
  #   end

  # end

  # def bid_check(bid)
    
  #   if bid.amount.blank?
  #     return false
  #   elsif bid.amount.nil?
  #     return false 
  #   # elsif bid.user_id == auction.current_user
  #   #  return false #bars current user from editing

  #   elsif bid.amount <= bid.auction.current_price
  #     return false
  #   elsif bid.amount + 1 < bid.auction.current_price
  #     return true
  #   else
  #     return false
  #   end
      
  # end

def check_bid_amounts
  @bid.amounts.to_i > @auction.reserve_price.to_i
    end

def check_price
  @bid.amount.to_i > @auction.reserve_price.to_i
end

end
