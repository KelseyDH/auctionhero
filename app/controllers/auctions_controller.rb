class AuctionsController < ApplicationController
  before_action :find_auction, only: [:edit, :show, :update, :destroy]

  def index
    @auctions = Auction.all
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    if @auction.save
      redirect_to @auction, notice: "auction created!"
    else
      render :new
    end
  end

  def edit
  end

  def show
    @auction = Auction.find(params[:id])
    @bids = @auction.bids.ordered_by_amount
  end

  def update
    if @auction.update_attributes(auction_params)
      redirect_to @auction, notice: "You have updated the auction!"
    else
      render :edit
    end
  end

  def destroy
    if @auction.destroy
      redirect_to root_path, notice: "Auction successfully deleted"
    else
      redirect_to root_path, error: "Auction could not be deleted"
    end
  end

  private

  def auction_params
    params.require(:auction).permit(:title, :body, :reserve_price, :end_date)
  end

  def find_auction
    @auction = Auction.find(params[:id])
  end

end
