require 'rails_helper'

RSpec.describe "Orders", type: :system, js: true do
  include_context :system_shared_context

  # ↓↓↓ここにテストコードを書く↓↓↓
  describe '新規登録に' do
    let (:menu) { create(:menu) }
    let (:order) { build(:order) }
    let (:payment_method_caption) do
      I18n.t("views.orders.payment_method.#{order.payment_method}", { locale: :ja })
    end

    it '成功すること' do
      visit new_order_path({ menu_id: menu.id })
      fill_in 'order[delivery_address]', with: order.delivery_address
      select payment_method_caption, from: 'order[payment_method]'
      fill_in 'order[card_number]', with: order.card_number
      click_button '登録する'
      expect(page).to have_content('Order was successfully created.')
    end
  end
  # ↑↑↑↑↑↑
end
