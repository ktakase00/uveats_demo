FactoryBot.define do
  factory :menu do
    sequence(:menu_name) { |n| "#{Sample::Menu::List.fetch(n).menu_name}#{n}" }
    sequence(:price) { |n| Sample::Menu::List.fetch(n).price }
    sequence(:description) { |n| Sample::Menu::List.fetch(n).description }
    sequence(:image) { |n| Sample::Menu::List.fetch(n).uploaded_file }
  end
end
