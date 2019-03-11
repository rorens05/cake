class ApplicationController < ActionController::Base

  before_action :show_console
  before_action :authenticate_user, except: [:login, :logout, :attempt_login]
  before_action :relogin_user, only: [:login]

  def show_console
    if Rails.env.development?
      console
    end
  end  

  def authenticate_user
    if session[:id] == nil
      redirect_to access_login_path
    end
  end

  def relogin_user
    if session[:id] != nil
      redirect_to root_path
    end
  end
end
