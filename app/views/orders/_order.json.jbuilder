json.extract! order, :id, :ordered_at, :customer_id, :product_id, :size_id, :no_of_items, :payment_method, :status, :delivery_location, :delivered_at, :created_at, :updated_at
json.url order_url(order, format: :json)
