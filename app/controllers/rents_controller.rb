class RentsController < ApplicationController
  # def index
  #   @rents = Rent.all
  # end

  # def new
  #   @rent = Rent.new
  # end

  # def show
  #   @rent = Rent.find(params[:id])
  # end

  def create
    @product = Product.find(params[:product_id])
    @rent = Rent.new
    @rent.user = current_user
    @rent.product = @product
    @rent.save!
    redirect_to mine_products_path
  end
end
