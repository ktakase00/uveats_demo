require 'rails_helper'

RSpec.describe "menus/edit", type: :view do
  before(:each) do
    @menu = assign(:menu, Menu.create!(
      menu_name: "MyText",
      price: "",
      description: "MyText",
      image: "MyText"
    ))
  end

  it "renders the edit menu form" do
    render

    assert_select "form[action=?][method=?]", menu_path(@menu), "post" do

      assert_select "textarea[name=?]", "menu[menu_name]"

      assert_select "input[name=?]", "menu[price]"

      assert_select "textarea[name=?]", "menu[description]"

      assert_select "textarea[name=?]", "menu[image]"
    end
  end
end
