class AccessController < ApplicationController
  def login
    
  end

  def attempt_login
    username = params[:username] || ""
    password = params[:password] || ""
    testing = Admin.first
    if testing.username == username
      if testing.authenticate(password)
        session[:id] = testing.id
        redirect_to root_path
      else
        flash[:notice] = "Invalid username password combination"
        redirect_to access_login_path
      end
    else
      flash[:notice] = "Invalid username password combination"
      redirect_to access_login_path
    end
  end

  def logout
    session[:id] = nil
    redirect_to access_login_path
  end
end

