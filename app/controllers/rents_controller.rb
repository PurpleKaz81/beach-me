class RentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @rent = Rent.new(rent_params)
    @rent.user = current_user
    @rent.product = @product
      if @rent.save
        redirect_to rented_products_path
      else
        render 'products/show', status: :unprocessable_entity
      end
  end

  private

  def rent_params
    params.require(:rent).permit(:quantity, :rent_date, :return_date)
  end
end
