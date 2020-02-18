require 'rails_helper'

RSpec.describe "menus/index", type: :view do
  before(:each) do
    assign(:menus, [
      Menu.create!(
        menu_name: "MyText",
        price: "",
        description: "MyText",
        image: "MyText"
      ),
      Menu.create!(
        menu_name: "MyText",
        price: "",
        description: "MyText",
        image: "MyText"
      )
    ])
  end

  it "renders a list of menus" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
