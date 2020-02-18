require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      menu_id: "",
      user_id: "",
      delivery_address: "MyText",
      payment_method: "MyText",
      card_number: "MyText"
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[menu_id]"

      assert_select "input[name=?]", "order[user_id]"

      assert_select "textarea[name=?]", "order[delivery_address]"

      assert_select "textarea[name=?]", "order[payment_method]"

      assert_select "textarea[name=?]", "order[card_number]"
    end
  end
end
