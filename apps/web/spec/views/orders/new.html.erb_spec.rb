require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      menu_id: "",
      user_id: "",
      delivery_address: "MyText",
      payment_method: "MyText",
      card_number: "MyText"
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[menu_id]"

      assert_select "input[name=?]", "order[user_id]"

      assert_select "textarea[name=?]", "order[delivery_address]"

      assert_select "textarea[name=?]", "order[payment_method]"

      assert_select "textarea[name=?]", "order[card_number]"
    end
  end
end
