json.id carted_product.id
json.product do
  json.partial! carted_product.product, partial: "api/products/product", as: :product
end
json.quantity carted_product.quantity
json.user_id carted_product.user_id
json.status carted_product.status
json.order_id carted_product.order_id