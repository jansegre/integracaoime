class PagesController < ApplicationController
  def show
    @menu = Menu.find_by(slug: params[:slug])
    @companies = Company.all
    @members = User.where member: true
    @page = @menu.page
  end
end
