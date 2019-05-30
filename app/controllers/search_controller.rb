class SearchController < ApplicationController
  layout 'admin'
  def search
    s = params[:search]
    @search_count = 0
    @customers = Customer.where("name like ? or address like ? or email like ? or status like ?", "%#{s}%", "%#{s}%", "%#{s}%", "%#{s}%")
    @products = Product.where("name like ? or description like ?", "%#{s}%", "%#{s}%" )
  end
end
