class StudentsController < ApplicationController
  before_filter :authenticate_student_user!

  # display resume
  def resume
    @resume = current_user.resume
    if @resume.nil?
      redirect_to action: "new_resume"
    end
  end

  # display resume create page
  def new_resume
    @resume = Resume.new
    @url = { action: "create_resume" }
  end

  # recive a post and create that resume
  def create_resume
    if current_user.create_resume(params[:resume])
      redirect_to({ action: "resume" }, notice: t("flash.resume_created"))
    else
      render action: "new_resume"
    end
  end

  # display resume edit page
  def edit_resume
    @resume = current_user.resume
    if @resume.nil?
      redirect_to new_resume_path
    end
    @url = { action: "update_resume" }
  end

  # recive a put and update a resume
  def update_resume
    if current_user.resume.update_attributes(params[:resume])
      redirect_to({ action: "resume" }, notice: t("flash.resume_updated"))
    else
      render action: "edit_resume"
    end
  end

  # display hints
  def hints
    @hints = Hint.all_published
  end
end
