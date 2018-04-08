class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :current_version
  helper_method :display_view

  before_action :set_default_version
  before_action :get_versions

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_version
    @current_version ||= Version.find_by(abbreviation: session[:version]) if session[:version]
  end

  def set_default_version
    session[:version] ||= 'KJV'
    current_version
  end

  def get_versions
    @versions = Version.all.where(active: true)
  end

end
