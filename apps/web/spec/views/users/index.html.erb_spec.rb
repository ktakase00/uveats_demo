require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        mail: "MyText",
        user_name: "MyText",
        password_digest: "Password Digest"
      ),
      User.create!(
        mail: "MyText",
        user_name: "MyText",
        password_digest: "Password Digest"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Password Digest".to_s, count: 2
  end
end
