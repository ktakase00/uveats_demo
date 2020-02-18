FactoryBot.define do
  factory :order do
    menu_id { "" }
    user_id { "" }
    sequence(:delivery_address) { |n| "MyText#{n}" }
    sequence(:payment_method) { |n| [Order::PAYMENT_METHOD_MONEY, Order::PAYMENT_METHOD_MONEY][n % 2] }
    sequence(:card_number) { |n| "MyText#{n}" }
  end
end
