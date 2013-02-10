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

  def calendars
    @calendars = Calendar.all
  end

  def how_to
  end

  def sponsor
  end

  def highlight
  end
end
