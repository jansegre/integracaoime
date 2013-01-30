class ApplicationController < ActionController::Base
  protect_from_forgery

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  # For use with ActiveAdmin
  def authenticate_admin_user!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "You don't have permission for this."
      redirect_to root_path
    end
  end

  # Override build_footer method in ActiveAdmin::Views::Pages
  require 'active_admin_views_pages_base.rb'
end
