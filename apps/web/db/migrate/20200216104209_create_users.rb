class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :mail
      t.text :user_name
      t.string :password_digest

      t.timestamps
    end
  end
end
