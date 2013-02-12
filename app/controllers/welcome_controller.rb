class WelcomeController < ApplicationController
  def index
    @highlights = Highlight.all
  end

  def terms
  end
end
