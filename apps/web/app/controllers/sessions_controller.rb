class SessionsController < ApplicationController
  before_action :set_user, only: [ :create ]
  before_action :authenticate_user, only: [ :create ]

  def new
    request.headers.each do |key, value|
      logger.info "#{key}=#{value}" if /^HTTP_/.match?(key)
    end
    @user = User.new
  end

  def create
    session[:user_id] = @me.id
    redirect_to menus_path
  end

  private

  def set_user
    @user = User.new(create_params)
    render :new if @user.invalid?(:login)
  end

  def authenticate_user
#    authed = @user.authenticate(@user.password)
#    redirect_to new_sessions_path, { alert: 'Login failed.' } if authed.nil?
#    @me = User.find_by({ mail: authed.mail })
    target = User.new(create_params)
    found = User.find_by({ mail: target.mail })
    authed = found.authenticate(target.password)
    if authed.nil?
      redirect_to new_session_path, { alert: t('errors.messages.login_fauire') }
      return
    end
    logger.info authed.attributes
    @me = authed
  end

  def create_params
    params.require(:user).permit(:mail, :password)
  end
end
