require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Customer", with: @order.customer_id
    fill_in "Delivered at", with: @order.delivered_at
    fill_in "Delivery location", with: @order.delivery_location
    fill_in "No of items", with: @order.no_of_items
    fill_in "Ordered at", with: @order.ordered_at
    fill_in "Payment method", with: @order.payment_method
    fill_in "Product", with: @order.product_id
    fill_in "Size", with: @order.size_id
    fill_in "Status", with: @order.status
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Customer", with: @order.customer_id
    fill_in "Delivered at", with: @order.delivered_at
    fill_in "Delivery location", with: @order.delivery_location
    fill_in "No of items", with: @order.no_of_items
    fill_in "Ordered at", with: @order.ordered_at
    fill_in "Payment method", with: @order.payment_method
    fill_in "Product", with: @order.product_id
    fill_in "Size", with: @order.size_id
    fill_in "Status", with: @order.status
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
