class PagesController < ApplicationController
  def show
    @menu = Menu.find_by(slug: params[:slug])
    @companies = Company.all
    @page = @menu.page
  end
end
