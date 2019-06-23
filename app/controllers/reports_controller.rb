class ReportsController < ApplicationController
  layout 'admin'
  def index 
    @type = params["type"] || "monthly"
    @type_name = @type.capitalize

    if @type == "monthly"    
      @date = params["month"] ? Date.today.change(month: params["month"].to_i) : Date.today
      @date = @date.change(day: 1)
      @orders = Order.where("DATE(ordered_at) >= ?", @date.beginning_of_day).where("DATE(ordered_at) < ?", @date + 1.months)
    elsif @type == "yearly"
      @date = Date.today
      @date = params["year"] ? @date.change(year: params["year"].to_i, month: 1, day: 1) : Date.today
      @orders = Order.where("Date(ordered_at) >= ? ", @date.beginning_of_day).where("Date(ordered_at) < ? ", @date + 1.years)
    elsif @type == "daily"
      @date = params["date"] ? params["date"].to_date : Date.today
      @orders = Order.where("Date(ordered_at) >= ? ", @date.beginning_of_day).where("Date(ordered_at) < ? ", @date + 1.days)
    end
    
  end
end
