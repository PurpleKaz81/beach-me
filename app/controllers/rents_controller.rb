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
    @rent = Rent.new(rent_params)
    @rent.user = current_user
    @rent.product = @product
    if @rent.quantity && @product.quantity >= @rent.quantity
      if @rent.save
        @product.quantity -= @rent.quantity
        @product.save
        redirect_to rented_products_path
      else
        redirect_to product_path(@product), alert: "Please fill in all fields."
      end
    else
      redirect_to @product, alert: "Product not available for rent."
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:quantity, :rent_date, :return_date)
  end

end
