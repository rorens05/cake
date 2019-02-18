require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { customer_id: @order.customer_id, delivered_at: @order.delivered_at, delivery_location: @order.delivery_location, no_of_items: @order.no_of_items, ordered_at: @order.ordered_at, payment_method: @order.payment_method, product_id: @order.product_id, size_id: @order.size_id, status: @order.status } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { customer_id: @order.customer_id, delivered_at: @order.delivered_at, delivery_location: @order.delivery_location, no_of_items: @order.no_of_items, ordered_at: @order.ordered_at, payment_method: @order.payment_method, product_id: @order.product_id, size_id: @order.size_id, status: @order.status } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
