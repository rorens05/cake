class CustomApiController < ApplicationController

  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user

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
end
