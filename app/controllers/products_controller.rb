class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def index
    if params[:query].present?
      @products = Product.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @products = Product.all
    end
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
   if @product.rents.present?
    redirect_to mine_products_path, notice: "This product cannot be deleted!" 
   else
    @product.destroy
    redirect_to root_path, status: :see_other, notice: 'Product was successfully destroyed.'
   end
  end

  def rented
    @rents = Rent.includes(:product).where(user: current_user)

    # @products = Product.joins(:rents).where(rents: { user: current_user })

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
