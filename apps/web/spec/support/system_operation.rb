RSpec.configure do |config|
  config.before(:each, type: :system) do
    config.include SharedOperation
  end
end
