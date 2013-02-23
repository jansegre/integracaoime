class PagesController < ApplicationController
  def show
    @menu = Menu.find_by(slug: params[:slug])
    @page = @menu.page
  end
end
