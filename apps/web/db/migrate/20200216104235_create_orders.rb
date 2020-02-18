class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.bigint :menu_id
      t.bigint :user_id
      t.text :delivery_address
      t.text :payment_method
      t.text :card_number

      t.timestamps
    end
  end
end
