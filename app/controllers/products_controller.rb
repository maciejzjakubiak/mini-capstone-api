class ProductsController < ApplicationController
  def all_products
    product = Product.all
    render json: product
  end

  def product1
    product1 = Product.first
    render json: product1
  end

  def product2
    product2 = Product.second
    render json: product2
  end

  def product3
    product3 = Product.third
    render json: product3
  end

  def product4
    product4 = Product.fourth
    render json: product4
  end
end
