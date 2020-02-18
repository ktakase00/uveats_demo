require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      mail: "MyText",
      user_name: "MyText",
      password_digest: "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "textarea[name=?]", "user[mail]"

      assert_select "textarea[name=?]", "user[user_name]"

      assert_select "input[name=?]", "user[password_digest]"
    end
  end
end
