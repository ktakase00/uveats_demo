require 'rails_helper'

RSpec.describe "menus/new", type: :view do
  before(:each) do
    assign(:menu, Menu.new(
      menu_name: "MyText",
      price: "",
      description: "MyText",
      image: "MyText"
    ))
  end

  it "renders new menu form" do
    render

    assert_select "form[action=?][method=?]", menus_path, "post" do

      assert_select "textarea[name=?]", "menu[menu_name]"

      assert_select "input[name=?]", "menu[price]"

      assert_select "textarea[name=?]", "menu[description]"

      assert_select "textarea[name=?]", "menu[image]"
    end
  end
end
