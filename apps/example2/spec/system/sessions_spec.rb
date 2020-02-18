require 'rails_helper'

RSpec.describe "Sessions", type: :system, js: true do
  # ↓↓↓ここにテストコードを書く↓↓↓
  describe 'ログインに' do
    let (:login_user) { create(:user) }

    it '成功すること' do
      visit new_session_path
      fill_in 'user[mail]', with: login_user.mail
      fill_in 'user[password]', with: login_user.password
      click_button 'ログイン'
      expect(page).to have_content('Menus')
    end
  end
  # ↑↑↑↑↑↑
end
