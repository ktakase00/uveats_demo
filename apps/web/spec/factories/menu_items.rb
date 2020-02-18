FactoryBot.define do
  factory :menu_item, class: 'Sample::Menu::Item' do
    sequence(:menu_name) { |n| "#{Sample::Menu::List.fetch(n).menu_name}#{n}" }
    sequence(:price) { |n| Sample::Menu::List.fetch(n).price }
    sequence(:description) { |n| Sample::Menu::List.fetch(n).description }
    sequence(:image_file) { |n| Sample::Menu::List.fetch(n).image_file }
  end
end
