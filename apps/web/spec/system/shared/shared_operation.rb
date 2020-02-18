module SharedOperation
  include Capybara::DSL

  def execute_login
    visit new_session_path
    fill_in 'user[mail]', with: login_user.mail
    fill_in 'user[password]', with: login_user.password
    click_button 'ログイン'
  end
end
