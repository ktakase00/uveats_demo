require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        menu_id: "",
        user_id: "",
        delivery_address: "MyText",
        payment_method: "MyText",
        card_number: "MyText"
      ),
      Order.create!(
        menu_id: "",
        user_id: "",
        delivery_address: "MyText",
        payment_method: "MyText",
        card_number: "MyText"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
