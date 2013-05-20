class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_menu

  def load_menu
    @root_menu = Menu.root_menu
    @company_menu = Menu.company_menu
    logos = Logo.all_active
    @sponsor_logos = logos.where is_sponsor: true
    @support_logos = logos.where is_sponsor: false
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    if current_user.admin
      admin_root_path
    elsif current_user.company_member?
      if current_company.page?
        company_page_path
      else
        root_path
      end
    else
      student_resume_path
    end
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
      redirect_to root_path, :alert => t('flash.company_required')
    end
  end

  def current_company
    current_user.company
  end

  # Override build_footer method in ActiveAdmin::Views::Pages
  require 'active_admin_views_pages_base'
end
