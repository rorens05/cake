require 'test_helper'

class CustomCakeOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @custom_cake_order = custom_cake_orders(:one)
  end

  test "should get index" do
    get custom_cake_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_custom_cake_order_url
    assert_response :success
  end

  test "should create custom_cake_order" do
    assert_difference('CustomCakeOrder.count') do
      post custom_cake_orders_url, params: { custom_cake_order: { color: @custom_cake_order.color, customer_id_id: @custom_cake_order.customer_id_id, flavor: @custom_cake_order.flavor, payment_method: @custom_cake_order.payment_method, price: @custom_cake_order.price, quantity: @custom_cake_order.quantity, shape: @custom_cake_order.shape, size: @custom_cake_order.size, theme: @custom_cake_order.theme } }
    end

    assert_redirected_to custom_cake_order_url(CustomCakeOrder.last)
  end

  test "should show custom_cake_order" do
    get custom_cake_order_url(@custom_cake_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_custom_cake_order_url(@custom_cake_order)
    assert_response :success
  end

  test "should update custom_cake_order" do
    patch custom_cake_order_url(@custom_cake_order), params: { custom_cake_order: { color: @custom_cake_order.color, customer_id_id: @custom_cake_order.customer_id_id, flavor: @custom_cake_order.flavor, payment_method: @custom_cake_order.payment_method, price: @custom_cake_order.price, quantity: @custom_cake_order.quantity, shape: @custom_cake_order.shape, size: @custom_cake_order.size, theme: @custom_cake_order.theme } }
    assert_redirected_to custom_cake_order_url(@custom_cake_order)
  end

  test "should destroy custom_cake_order" do
    assert_difference('CustomCakeOrder.count', -1) do
      delete custom_cake_order_url(@custom_cake_order)
    end

    assert_redirected_to custom_cake_orders_url
  end
end
