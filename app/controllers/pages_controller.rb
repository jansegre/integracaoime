class PagesController < ApplicationController
  def show
    @menu = Menu.find_by(slug: params[:slug])
    if @menu.company_page?
      authenticate_company_user!
    elsif @menu.student_page?
      authenticate_student_user!
    end
    @companies = Company.where participating: true
    @members = User.where member: true
    @page = @menu.page
  end
end
