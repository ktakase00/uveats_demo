require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      menu_id: "",
      user_id: "",
      delivery_address: "MyText",
      payment_method: "MyText",
      card_number: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
