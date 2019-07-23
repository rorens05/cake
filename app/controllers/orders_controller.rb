class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :update_status]
  layout 'admin'

  COMMON_YEAR_DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  def days_in_month(month, year = Time.now.year)
     return 29 if month == 2 && Date.gregorian_leap?(year)
     COMMON_YEAR_DAYS_IN_MONTH[month]
  end 

  def calendar
    @date = Date.today
    if params[:date]
      @date = Date.parse(params[:date])
    end
    @no_of_days = days_in_month(@date.month, @date.year)
    @day_of_week = @date.strftime("%u").to_i
    @starting_day = -@day_of_week + 2
  end

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where(cart: false)
    if params[:date]
      @date = Date.parse(params[:date])
      @orders = Order.where("date_to_be_delivered = ? ",  @date.strftime("%-m-%-d-%Y"))
    end
  end

  def cart
    @orders = Order.where(cart: true)
  end
  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @sizes = Size.where('id < 0')
  end

  # GET /orders/1/edit
  def edit
    @sizes = @order.product.sizes
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.status = "Pending"

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_status 
    @order.status = params[:status] 
    @order.note = params[:note]
    if @order.status == "Delivered" || @order.status == "Aproved" 
      @order.delivered_at = Date.today
    end
    @order.save
    flash[:notice] = 'Status updated'
    redirect_to @order
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:ordered_at, :date_to_be_delivered, :customer_id, :product_id, :size_id, :no_of_items, :payment_method, :delivered_at, :date_to_be_delivered, :delivery_location)
    end
end
