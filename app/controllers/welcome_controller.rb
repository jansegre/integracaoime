class WelcomeController < ApplicationController
  def index
    @highlights = Highlight.all_active
  end

  def terms
  end
end
