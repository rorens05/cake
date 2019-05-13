require "application_system_test_case"

class CustomCakeOrdersTest < ApplicationSystemTestCase
  setup do
    @custom_cake_order = custom_cake_orders(:one)
  end

  test "visiting the index" do
    visit custom_cake_orders_url
    assert_selector "h1", text: "Custom Cake Orders"
  end

  test "creating a Custom cake order" do
    visit custom_cake_orders_url
    click_on "New Custom Cake Order"

    fill_in "Color", with: @custom_cake_order.color
    fill_in "Customer id", with: @custom_cake_order.customer_id_id
    fill_in "Flavor", with: @custom_cake_order.flavor
    fill_in "Payment method", with: @custom_cake_order.payment_method
    fill_in "Price", with: @custom_cake_order.price
    fill_in "Quantity", with: @custom_cake_order.quantity
    fill_in "Shape", with: @custom_cake_order.shape
    fill_in "Size", with: @custom_cake_order.size
    fill_in "Theme", with: @custom_cake_order.theme
    click_on "Create Custom cake order"

    assert_text "Custom cake order was successfully created"
    click_on "Back"
  end

  test "updating a Custom cake order" do
    visit custom_cake_orders_url
    click_on "Edit", match: :first

    fill_in "Color", with: @custom_cake_order.color
    fill_in "Customer id", with: @custom_cake_order.customer_id_id
    fill_in "Flavor", with: @custom_cake_order.flavor
    fill_in "Payment method", with: @custom_cake_order.payment_method
    fill_in "Price", with: @custom_cake_order.price
    fill_in "Quantity", with: @custom_cake_order.quantity
    fill_in "Shape", with: @custom_cake_order.shape
    fill_in "Size", with: @custom_cake_order.size
    fill_in "Theme", with: @custom_cake_order.theme
    click_on "Update Custom cake order"

    assert_text "Custom cake order was successfully updated"
    click_on "Back"
  end

  test "destroying a Custom cake order" do
    visit custom_cake_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Custom cake order was successfully destroyed"
  end
end
