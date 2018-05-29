Rails.application.routes.draw do
  

  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get "/products_url" => "products#products_action"
  end
end
