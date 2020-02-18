require 'rails_helper'

RSpec.describe "menus/show", type: :view do
  before(:each) do
    @menu = assign(:menu, Menu.create!(
      menu_name: "MyText",
      price: "",
      description: "MyText",
      image: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
