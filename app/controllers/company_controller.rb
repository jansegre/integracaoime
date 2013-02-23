class CompanyController < ApplicationController
  before_filter :authenticate_company_user!

  # show all resumes
  #TODO pagination
  def resumes
    if current_company.subscriber?
      @resumes = Resume.all
    else
      redirect_to root_path, alert: t("flash.not_subscriber")
    end
  end

  def resume
    if current_company.subscriber?
      @resume = Resume.find(params[:id])
    else
      redirect_to root_path, alert: t("flash.not_subscriber")
    end
  end

  def calendars
    @calendars = Calendar.all
  end

  def how_to
  end

  def sponsor
  end

  def highlight
    @highlight = current_company.highlight
    if @highlight.nil?
      @highlight = Highlight.new
      @url = { action: "create_highlight" }
    else
      @url = { action: "update_highlight" }
    end
  end

  def create_highlight
    if current_company.create_highlight(params[:highlight])
      redirect_to({ action: "highlight" }, notice: t("flash.highlight_created"))
    else
      render action: "highlight"
    end
  end

  def update_highlight
    if current_company.highlight.update_attributes(params[:highlight])
      redirect_to({ action: "highlight" }, notice: t("flash.highlight_updated"))
    else
      render action: "highlight"
    end
  end
end
