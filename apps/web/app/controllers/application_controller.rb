class ApplicationController < ActionController::Base
  include HttpAcceptLanguage::AutoLocale

  def check_login
    redirect_to new_session_path if session[:user_id].nil?
    @me = User.find_by({ id: session[:user_id] })
  end
end
