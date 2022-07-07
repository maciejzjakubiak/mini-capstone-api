Rails.application.routes.draw do
  get "/products" => "products#index"
  get "/products/:id" => "products#any_product"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"
end
