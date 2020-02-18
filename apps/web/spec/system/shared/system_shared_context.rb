shared_context :system_shared_context do
  let (:login_user) { create(:user) }

  before (:each) do
    execute_login
  end
end
