class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.text :menu_name
      t.bigint :price
      t.text :description
      t.text :image

      t.timestamps
    end
  end
end
