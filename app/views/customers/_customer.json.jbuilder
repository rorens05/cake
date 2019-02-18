json.extract! customer, :id, :name, :address, :contact_no, :email, :gender, :status, :created_at, :updated_at
json.url customer_url(customer, format: :json)
