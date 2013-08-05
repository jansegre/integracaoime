class PagesController < ApplicationController
  def show
    @menu = Menu.find_by(slug: params[:slug])
    if @menu.company_page?
      authenticate_company_user!
    elsif @menu.student_page?
      authenticate_student_user!
    end
    @page = @menu.page
    if @page.show_companies
      @companies = Company.all
    elsif @page.show_sponsors
      @companies = Company.where sponsor: true
    elsif @page.show_participating
      @companies = Company.where participating: true
    else
      @companies = nil
    end
    if @page.show_members
      @members = User.where member: true
    else
      @members = nil
    end
  end
end
