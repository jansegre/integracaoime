class WelcomeController < ApplicationController
  def index
    @highlights = Highlight.all_active
    @sponsors = Sponsor.all_active
    @partners = Partner.all_active
  end

  def terms
  end
end
