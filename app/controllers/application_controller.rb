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
      redirect_to root_path, :alert => t('flash.admin_required')
    end
  end

  # For use with StudentsController
  def authenticate_student_user!
    authenticate_user!
    unless current_user.student?
      redirect_to root_path, :alert => t('flash.student_required')
    end
  end

  # For use with CompanyController
  def authenticate_company_user!
    authenticate_user!
    unless current_user.company_member?
      redirect_to root_path, :alert => t('flash.student_required')
    end
  end

  def current_company
    current_user.company
  end

  # Override build_footer method in ActiveAdmin::Views::Pages
  require 'active_admin_views_pages_base'
end
