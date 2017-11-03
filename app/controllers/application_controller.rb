class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_signed_in?
    if session[:user_id].present? && current_user.nil?
      session[:user_id] = nil
    end
    session[:user_id].present?
  end

  helper_method :user_signed_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  
  helper_method :current_user


  def authenticate_user!
    if !user_signed_in?
      redirect_to new_session_path, notice: 'Please sign in'
    end
  end


end
