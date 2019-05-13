class CustomCakeOrdersController < ApplicationController
  before_action :set_custom_cake_order, only: [:show, :edit, :update, :destroy]

  layout 'admin'
  # GET /custom_cake_orders
  # GET /custom_cake_orders.json
  def index
    @custom_cake_orders = CustomCakeOrder.all
  end

  # GET /custom_cake_orders/1
  # GET /custom_cake_orders/1.json
  def show
  end

  # GET /custom_cake_orders/new
  def new
    @custom_cake_order = CustomCakeOrder.new
  end

  # GET /custom_cake_orders/1/edit
  def edit
  end

  # POST /custom_cake_orders
  # POST /custom_cake_orders.json
  def create
    @custom_cake_order = CustomCakeOrder.new(custom_cake_order_params)

    respond_to do |format|
      if @custom_cake_order.save
        format.html { redirect_to @custom_cake_order, notice: 'Custom cake order was successfully created.' }
        format.json { render :show, status: :created, location: @custom_cake_order }
      else
        format.html { render :new }
        format.json { render json: @custom_cake_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custom_cake_orders/1
  # PATCH/PUT /custom_cake_orders/1.json
  def update
    respond_to do |format|
      if @custom_cake_order.update(custom_cake_order_params)
        format.html { redirect_to @custom_cake_order, notice: 'Custom cake order was successfully updated.' }
        format.json { render :show, status: :ok, location: @custom_cake_order }
      else
        format.html { render :edit }
        format.json { render json: @custom_cake_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_cake_orders/1
  # DELETE /custom_cake_orders/1.json
  def destroy
    @custom_cake_order.destroy
    respond_to do |format|
      format.html { redirect_to custom_cake_orders_url, notice: 'Custom cake order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_cake_order
      @custom_cake_order = CustomCakeOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_cake_order_params
      params.require(:custom_cake_order).permit(:theme, :size, :flavor, :color, :shape, :customer_id_id, :quantity, :price, :payment_method)
    end
end
