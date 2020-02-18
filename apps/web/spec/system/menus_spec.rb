require 'rails_helper'

RSpec.describe "Menus", type: :system, js: true do
  include_context :system_shared_context

  shared_examples :execute_menu_form do
    it '成功すること' do
      visit page_url
      fill_in 'menu[menu_name]', with: menu_item.menu_name
      fill_in 'menu[price]', with: menu_item.price
      fill_in 'menu[description]', with: menu_item.description
      attach_file 'menu[image]', menu_item.image_path
      click_button submit_caption
      expect(page).to have_content(expected)
    end
  end

  shared_examples :execute_menu_list do
    it '成功すること' do
      visit menus_path
      card_ary = find_all(:xpath, "//div[@class='card']")
      expect(card_ary.length).to eq(menu_ary.length)
    end
  end

  describe '新規登録に' do
    let (:menu_item) { build(:menu_item) }
    let (:page_url) { new_menu_path }
    let (:submit_caption) { '登録する' }
    let (:expected) { 'Menu was successfully created.' }
    include_examples :execute_menu_form
  end

  describe '編集に' do
    let (:target) { create(:menu) }
    let (:menu_item) { build(:menu_item) }
    let (:page_url) { edit_menu_path(target) }
    let (:submit_caption) { '更新する' }
    let (:expected) { 'Menu was successfully updated.' }
    include_examples :execute_menu_form
  end

  describe '一覧表示に' do
    let! (:menu_ary) { create_list(:menu, 12) }
    include_examples :execute_menu_list
  end
end
