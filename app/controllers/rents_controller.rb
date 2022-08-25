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
    if @product.quantity >= @rent.quantity
      if @rent.save
        @product.quantity -= @rent.quantity
        @product.save
        redirect_to rented_products_path
      else
        render product_path(@product), status: :unprocessable_entity
      end
    else
      redirect_to @product, notice: "Product not available for rent."
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:quantity)
  end

end
