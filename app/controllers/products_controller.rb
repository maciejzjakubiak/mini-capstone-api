class ProductsController < ApplicationController
  def index
    @products = Product.all
    render template: "products/index"
  end

  def any_product
    @product = Product.find_by(id: params[:id])
    render template: "products/show"
  end

  def create
    @product = Product.create(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
    )
    render template: "products/show"
  end

  def update
    product_id = params["id"]
    @product = Product.find_by(id: product_id)

    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    @product.image_url = params["image_url"] || @product.image_url
    @product.description = params["description"] || @product.description
    @product.save
    render template: "products/show"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Gone and Gooooone" }
  end
end
