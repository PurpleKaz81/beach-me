class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params)
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
    @product.update(params)
    redirect_to @products
  end

  def destroy

  end
end

private

def params
  params.require(:product).permit(:name, :description, :price, :user_id)
end
