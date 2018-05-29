Rails.application.routes.draw do
  get "/products_url" => "api/products#name"

  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    "products#products_action"
  end
end
