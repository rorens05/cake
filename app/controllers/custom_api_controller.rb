class CustomApiController < ApplicationController

  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user

  def add_custom_cake
    custom = CustomCakeOrder.new
    custom.theme = params["theme"]
    custom.size = params["size"]
    custom.flavor = params["flavor"]
    custom.color = params["color"]
    custom.shape = params["shape"]
    custom.customer_id = params["customer_id"]
    custom.quantity = params["quantity"]
    custom.price = params["price"]
    custom.layers = params["layers"]
    custom.payment_method = "COD"
    custom.image_json = params["image"]
    custom.save_image

    if(custom.save)
      render json: {status: "success"}, status: :ok
    else
      render json: {status: "failed"}, status: :ok
    end    
  end

  def checkout_cart
    cake = Order.find_by_id(params['id'])
    cake.ordered_at = Date.today
    cake.cart = false
    cake.payment_method = "COD"
    if cake.save
      render json: {status: "success"}, status: :ok
    else
      render json: {status: "failed", error: cake.errors.full_messages}, status: :ok
    end
  end

  def add_to_cart
    customer_id = params["customer_id"]
    product_id = params["product_id"]
    size_id = params["size_id"]
    no_of_items = params["no_of_items"]
    delivery_location = params["delivery_location"]

    order = Order.new
    order.customer_id = customer_id
    order.product_id = product_id
    order.size_id = size_id
    order.no_of_items = no_of_items
    order.status = "Pending"
    order.delivery_location = delivery_location
    order.cart = true

    if order.save
      render json: {status: 'success', message: 'cart saved', data: order}, status: :ok
    else
      render json: {status: 'failed', message: 'cart not saved', error: order.errors.full_messages}, status: :ok
    end    
  end

  def create_user
    user = Customer.new
    user.name = params[:name]
    user.address = params[:address]
    user.contact_no = params[:contact_no]
    user.email = params[:email]
    user.gender = params[:gender]
    user.status = params[:status]
    user.password = params[:password]
    user.image = params[:image]
    if user.save
      render json: {status: 'success', message: 'user saved', user: user}, status: :ok
    else
      render json: {status: 'failed', message: 'user not saved', error: user.errors.full_messages}, status: :ok
    end
  end

  def login
    user = Customer.find_by_email(params[:email])
    if user
    if user.authenticate(params[:password])
        user1 = user.attributes
        if user.image.attachment
          user1[:image] = url_for(user.image)
        else
          user1[:image] = ""
        end
        render json: {status: 'success', message: "Your welcome #{user.name}", user: user1}, status: :ok
      else
        render json: {status: 'failed', message: 'Invalid email and password combination'}, status: :ok
      end
    else
      render json: {status: 'failed', message: 'Invalid email and password combination'}, status: :ok
    end

  end

  def get_categories
    temps = Category.all
    categories = []
    temps.each do |temp|
      category = temp.attributes
      if temp.image.attachment
        category[:image] = url_for(temp.image)
      else
        category[:image] = ""
      end
      categories << category
    end
    
    render json: {status: 'success', message: 'Categories loaded', categories: categories}, status: :ok
  end

  def get_cakes
    temps = Product.where(category_id: params[:id])
    products = []
    
    temps.each do |temp|
      product = temp.attributes
      if temp.image.attachment
        product[:image] = url_for(temp.image)
      else
        product[:image] = ""
      end
      products << product
    end
    render json: {status: 'success', message: 'Products loaded', categories: products}, status: :ok

  end

  def get_sizes
    cake = Product.find(params[:id])
    if cake
      render json: {status: 'success', message: 'Sizes loaded', data: cake.sizes}, status: :ok
    else
      render json: {status: 'failed', message: 'Invalid id for cake'}, status: :ok
    end
  end

  def create_cod_order
    order = Order.new(ordered_at: Time.now, customer_id: params[:customer_id], size_id: params[:size_id], no_of_items: params[:items], payment_method: params[:payment_method], delivery_location: params['delivery_location'] )
    order.product = Size.find(params[:size_id]).product
    order.status = 'Pending'
    if order.save
      render json: {status: 'success', message: 'Sizes loaded', data: order}, status: :ok

    else 
      render json: {status: 'failed', message: 'Error', data: order.errors.full_messages}, status: :ok

    end
  end

  def get_orders
    orders = Order.where(customer_id: params[:id]).where(cart: false)
    data = []
    
    orders.each do |order|
      
      temp = order.attributes
      temp[:image] = order.product.image.attachment ? url_for(order.product.image) : ""
      temp[:product_name] = order.product.name
      temp[:size_label] = order.size.label
      temp[:size_price] = order.size.price
      data << temp
    end
    
    render json: {status: 'success', message: 'Sizes loaded', data: data}, status: :ok
  end

  def get_cart
    orders = Order.where(customer_id: params[:id]).where(cart: true)
    data = []
    
    orders.each do |order|
      
      temp = order.attributes
      temp[:image] = order.product.image.attachment ? url_for(order.product.image) : ""
      temp[:product_name] = order.product.name
      temp[:size_label] = order.size.label
      temp[:size_price] = order.size.price
      data << temp
    end
    
    render json: {status: 'success', message: 'Sizes loaded', data: data}, status: :ok
  end

  def signup
    image = params[:image]
    name = params[:name]
    gender = params[:gender]
    address = params[:address]
    contact = params[:contact]
    email = params[:email]
    
    customer = Customer.new
    customer.image_json = image
    customer.save_image
    customer.name = name
    customer.gender = gender
    customer.address = address
    customer.contact_no = contact
    customer.email = email
    customer.status = "Pending"
    customer.password = "cake"

    if customer.save
      render json: {status: 'success', message: 'Success', data: customer}, status: :ok
    else
      render json: {status: 'failed', message: 'Failed'}, status: :ok
    end
  end

  def change_password
    customer = Customer.find(params[:id])
    if customer.authenticate(params[:old_password])
      customer.password = params[:new_password]
      customer.password_confirmation = params[:confirm_password]
      if customer.save
        render json: {status: 'success', message: 'Password Changed'}, status: :ok

      else 
        render json: {status: 'failed', message: 'Password not match'}, status: :ok

      end
      
    else
      render json: {status: 'failed', message: 'Old password is incorrect'}, status: :ok
    end
  end
end
