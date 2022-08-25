class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @rent = Rent.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(strong_params)
    @product.user = current_user
    if @product.save
      redirect_to @product, notice: "Product created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(strong_params)
    redirect_to @product
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, status: :see_other, notice: 'Product was successfully destroyed.'
  end

  def rented
    @products = Product.joins(:rents).where(rents: { user: current_user })

    # @products = current_user.rents.map { |rent| rent.product }

    # @products = current_user.rents.map(&:product)
  end

  def mine
    @products = current_user.products
  end

  private

  def strong_params
    params.require(:product).permit(:name, :description, :price, :quantity)
  end
end
