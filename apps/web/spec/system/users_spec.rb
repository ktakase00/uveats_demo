require 'rails_helper'

RSpec.describe "Users", type: :system, js: true do
  include_context :system_shared_context

  shared_examples :execute_user_form do
    it '成功すること' do
      visit page_url
      fill_in 'user[mail]', with: user.mail
      fill_in 'user[user_name]', with: user.user_name
      fill_in 'user[password]', with: user.password
      click_button button_caption
      expect(page).to have_content(expected)
    end
  end

  shared_examples :execute_user_destroy do
    it '成功すること' do
      visit users_path
      accept_confirm do
        find(:xpath, destroy_xpath).click
      end
      expect(page).to have_content(expected)
    end
  end

  describe '新規登録に' do
    let (:user) { build(:user) }
    let (:page_url) { new_user_path }
    let (:button_caption) { '登録する' }
    let (:expected) { 'User was successfully created.' }
    include_examples :execute_user_form
  end

  describe '編集に' do
    let (:target) { create(:user) }
    let (:user) { build(:user) }
    let (:page_url) { edit_user_path(target) }
    let (:button_caption) { '更新する' }
    let (:expected) { 'User was successfully updated.' }
    include_examples :execute_user_form
  end

  describe '削除に' do
    let! (:target) { create(:user) }
    let (:target_xpath) { "contains(@href, '#{user_path(target)}')" }
    let (:destroy_xpath) { "//a[text()='Destroy'][#{target_xpath}]" }
    let (:expected) { 'User was successfully destroyed.' }
    include_examples :execute_user_destroy
  end
end
