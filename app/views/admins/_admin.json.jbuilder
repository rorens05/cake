json.extract! admin, :id, :name, :username, :email, :password, :created_at, :updated_at
json.url admin_url(admin, format: :json)
